Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D6B6725FDE4
	for <lists+linux-omap@lfdr.de>; Mon,  7 Sep 2020 18:01:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730278AbgIGQBZ (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 7 Sep 2020 12:01:25 -0400
Received: from mx07-00178001.pphosted.com ([185.132.182.106]:24968 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1730175AbgIGQAy (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 7 Sep 2020 12:00:54 -0400
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 087FwmWY007780;
        Mon, 7 Sep 2020 18:00:41 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=STMicroelectronics;
 bh=5hJXgMmfM7j2x45Htgd+XTxABN7i6bZcNnBR7TltiQc=;
 b=qfXjG9BjlvQUBOqflF5p7z3776fBAB+qsPwWEZdiK0zDCeI4eZlhV+vIE30OMOhK6nKH
 v5Br7aHHIf03skfADKd+dUjh8REcY+xHif2Z00oSIxnDDVakh5MqoguroyyTy1B3ewfq
 LBb0FF5ojDUpzkXbtm7SbS5yU8IZ7DUF5CxuqcVHsLHSy2uOuzlIo/45KbMxJpFkf+xm
 wJlgRlpSV8g6A/amCIf0niKXL+LA9S25AnAnNyB+A90AaWWIndeFprq6Egb60U4XndZB
 DdB8W7GqnqBkDQMRAV9rhj1PWtDhSXtoUoGo4pUEag+zFJhethRBN9fkK12MqlIak0PR Mw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 33c0eujvvw-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 07 Sep 2020 18:00:41 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id C336F10002A;
        Mon,  7 Sep 2020 18:00:40 +0200 (CEST)
Received: from Webmail-eu.st.com (gpxdag3node5.st.com [10.75.127.72])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 8526B212132;
        Mon,  7 Sep 2020 18:00:40 +0200 (CEST)
Received: from lmecxl0995.lme.st.com (10.75.127.46) by GPXDAG3NODE5.st.com
 (10.75.127.72) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 7 Sep
 2020 18:00:39 +0200
Subject: Re: [balbi-usb:testing/next 29/33] drivers/usb/dwc2/drd.c:83:37:
 error: 'struct dwc2_hsotg' has no member named 'test_mode'
To:     Felipe Balbi <balbi@kernel.org>, kernel test robot <lkp@intel.com>
CC:     "kbuild-all@lists.01.org" <kbuild-all@lists.01.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>
References: <202009072101.xr4ImAoy%lkp@intel.com> <877dt5ofhf.fsf@kernel.org>
From:   Amelie DELAUNAY <amelie.delaunay@st.com>
Message-ID: <8ede307b-ccd1-21eb-fcab-826f8939c695@st.com>
Date:   Mon, 7 Sep 2020 18:00:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <877dt5ofhf.fsf@kernel.org>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG3NODE3.st.com (10.75.127.9) To GPXDAG3NODE5.st.com
 (10.75.127.72)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235,18.0.687
 definitions=2020-09-07_10:2020-09-07,2020-09-07 signatures=0
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi Felipe,

On 9/7/20 3:58 PM, Felipe Balbi wrote:
> kernel test robot <lkp@intel.com> writes:
>> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/balbi/usb.git testing/next
>> head:   c9bb389c50ce07f0e4e105eb84f5541916bea8e8
>> commit: 0e9bd6770c25a3dbd9cb1c9fc132b9e4a65da7cd [29/33] usb: dwc2: override PHY input signals with usb role switch support
>> config: arm64-randconfig-s031-20200907 (attached as .config)
>> compiler: aarch64-linux-gcc (GCC) 9.3.0
>> reproduce:
>>          wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>>          chmod +x ~/bin/make.cross
>>          # apt-get install sparse
>>          # sparse version: v0.6.2-191-g10164920-dirty
>>          git checkout 0e9bd6770c25a3dbd9cb1c9fc132b9e4a65da7cd
>>          # save the attached .config to linux build tree
>>          COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-9.3.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' ARCH=arm64
>>
>> If you fix the issue, kindly add following tag as appropriate
>> Reported-by: kernel test robot <lkp@intel.com>
>>
>> All errors (new ones prefixed by >>):
>>
>>     drivers/usb/dwc2/drd.c: In function 'dwc2_drd_role_sw_set':
>>>> drivers/usb/dwc2/drd.c:83:37: error: 'struct dwc2_hsotg' has no member named 'test_mode'
>>        83 |   if (role == USB_ROLE_NONE && hsotg->test_mode) {
>>           |                                     ^~
> 
> patch dropped now. Amelie, can you send a fixed up version?
> 

This issue is already fixed in v5: 
https://lore.kernel.org/patchwork/project/lkml/list/?series=455508

Could you apply this version of the patchset ?
