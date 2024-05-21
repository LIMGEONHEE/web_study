/**
 * event.html에 포함.
 */

// button#btnInput 요소를 찾음:
const btnInput = document.querySelector('button#btnInput');

// btnInput에 클릭 이벤트 리스너를 설정:
// input#itemInput에 입력된 내용을 ul 요소의 li로 추가.
btnInput.addEventListener('click', function (e) {
//    console.log(e); //-> PointerEvent
    
    const itemInput = document.querySelector('input#itemInput');
    const itemList = document.querySelector('ul#itemList');
    itemList.innerHTML += `<li> ${itemInput.value} </li>`;
    itemInput.value = '';
});

// TODO: input#itemInput2 요소에 'keydown' 이벤트 리스너를 등록:
// 엔터키가 눌렸을 때, input에 입력된 내용을 ul#itemList2의 리스트 아이템으로 추가.
document.getElementById('itemInput2').addEventListener('keydown', (e) => {
    if (e.key === 'Enter') {
        const itemInput2 = document.querySelector('input#itemInput2');
        const itemList2 = document.querySelector('ul#itemList2');
        itemList2.innerHTML += `<li> ${itemInput2.value} </li>`;
        itemInput2.value = '';
    }
});

// TODO: input#username 요소에 'change' 이벤트 리스너를 등록:
// input에 입력된 내용이 바뀔 때마다 div를 입력 내용으로 덮어씀.
document.getElementById('username').addEventListener('change', (e) => {
    // change 이벤트는 input이 편집상태가 아니고(포커스를 잃어버린 상태이고), 
    // input에 입력된 값이 이전과 달라진 경우에 발생함.
    const username = document.querySelector('input#username');
    const output = document.querySelector('div#output');
    output.innerHTML = username.value;
});

// TODO: img#bulb 요소에 'mouseenter' 이벤트 리스너를 등록:
// img의 src를 'images/bulb_on.gif'로 변경.
document.querySelector('#bulb').addEventListener('mouseenter', (e) => {
    const bulb = document.querySelector('#bulb');
    bulb.src = 'images/bulb_on.gif';
    bulb.alt = 'bulb_on';
    
});

// TODO: img#bulb 요소에 'mouseleave' 이벤트 리스너를 등록:
// img의 src를 'images/bulb_off.gif'로 변경.
document.querySelector('#bulb').addEventListener('mouseleave', (e) => {
    const bulb = document.querySelector('#bulb');
    bulb.src = 'images/bulb_off.gif';
    bulb.alt = 'bulb_off';
    
});
