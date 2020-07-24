Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A07D422C533
	for <lists+linux-omap@lfdr.de>; Fri, 24 Jul 2020 14:31:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726651AbgGXMbh (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 24 Jul 2020 08:31:37 -0400
Received: from mx07-00178001.pphosted.com ([62.209.51.94]:38757 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726258AbgGXMbh (ORCPT
        <rfc822;linux-omap@vger.kernel.org>);
        Fri, 24 Jul 2020 08:31:37 -0400
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 06OCRCfm028401;
        Fri, 24 Jul 2020 14:31:24 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=subject : from : to : cc
 : references : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=STMicroelectronics;
 bh=O66ccmY/REVKy2GoRLs49NUFzUEYfOrO4dVexl8GSkU=;
 b=qxqY5s0FwMdkeb0p6bNa1wDQAFe7wOLK6rKgpDjqomYDLpreJcOxo8sy3sMrJgPUvON/
 L2Vu2VxWQgicnvxlrVxHbv0bt3ww68LgqkyN6V1EdKbxea4TSZ3vmn+zuDJYQp+Rjr3F
 4BeO+5/CV4i1Pqszz873dy8kqiTUbGbOxXmaoNK7CCQASfkmEbmWBIaX9bFmzEl+JUHa
 9qSi4mohy99VMklZL6W+wbGXASaQ5Lgv9UjB2SVQLJipTm+yYTcKxSCppIX4JW1pzujX
 l/f426ISv1ZZhacQL9YJU/qArKT2LbFhXIa3Sg9GVlmblY0As3RsRvmBeYdhg2ONB1rI kw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 32bs6vg2ky-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 24 Jul 2020 14:31:24 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 487C410002A;
        Fri, 24 Jul 2020 14:31:24 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id E94042B4D33;
        Fri, 24 Jul 2020 14:31:23 +0200 (CEST)
Received: from lmecxl0995.lme.st.com (10.75.127.44) by SFHDAG3NODE2.st.com
 (10.75.127.8) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Fri, 24 Jul
 2020 14:31:23 +0200
Subject: Re: [balbi-usb:testing/next 1/39] drivers/usb/dwc2/drd.c:80:36:
 error: 'struct dwc2_hsotg' has no member named 'test_mode'
From:   Amelie DELAUNAY <amelie.delaunay@st.com>
To:     Felipe Balbi <balbi@kernel.org>, kernel test robot <lkp@intel.com>,
        Minas Harutyunyan <hminas@synopsys.com>
CC:     "kbuild-all@lists.01.org" <kbuild-all@lists.01.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>
References: <202007241311.MMbsxewn%lkp@intel.com> <875zadnyek.fsf@kernel.org>
 <8098bdd6-9de2-dfdf-1e50-b027296ea254@st.com>
 <a8176140-3c57-1d64-ba2b-a24b23bc4201@st.com>
Message-ID: <946c028b-5ee8-f604-2f4c-ba4256a313f3@st.com>
Date:   Fri, 24 Jul 2020 14:31:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <a8176140-3c57-1d64-ba2b-a24b23bc4201@st.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG5NODE1.st.com (10.75.127.13) To SFHDAG3NODE2.st.com
 (10.75.127.8)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235,18.0.687
 definitions=2020-07-24_04:2020-07-24,2020-07-24 signatures=0
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 7/24/20 12:48 PM, Amelie DELAUNAY wrote:
> On 7/24/20 9:59 AM, Amelie DELAUNAY wrote:
>> Hi Felipe,
>>
>> On 7/24/20 9:51 AM, Felipe Balbi wrote:
>>> kernel test robot <lkp@intel.com> writes:
>>>
>>>> tree:   
>>>> https://git.kernel.org/pub/scm/linux/kernel/git/balbi/usb.git 
>>>> testing/next
>>>> head:   74dbc49b08d37ed9d4fd440d8896626733f80564
>>>> commit: bc0f0d4a5853e32ba97a0318f774570428fc5634 [1/39] usb: dwc2: 
>>>> override PHY input signals with usb role switch support
>>>> config: nios2-randconfig-r002-20200724 (attached as .config)
>>>> compiler: nios2-linux-gcc (GCC) 9.3.0
>>>> reproduce (this is a W=1 build):
>>>>          wget 
>>>> https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross 
>>>> -O ~/bin/make.cross
>>>>          chmod +x ~/bin/make.cross
>>>>          git checkout bc0f0d4a5853e32ba97a0318f774570428fc5634
>>>>          # save the attached .config to linux build tree
>>>>          COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-9.3.0 
>>>> make.cross ARCH=nios2
>>>>
>>>> If you fix the issue, kindly add following tag as appropriate
>>>> Reported-by: kernel test robot <lkp@intel.com>
>>>>
>>>> All errors (new ones prefixed by >>):
>>>>
>>>>     drivers/usb/dwc2/drd.c: In function 'dwc2_drd_role_sw_set':
>>>>>> drivers/usb/dwc2/drd.c:80:36: error: 'struct dwc2_hsotg' has no 
>>>>>> member named 'test_mode'
>>>>        80 |  if (role == USB_ROLE_NONE && hsotg->test_mode) {
>>>
>>> weird, this compiled just fine here with allmodconfig on AArch64.
>>>
>>> /me goes check. Oh, I see what's happening, hsotg->test_mode is only
>>> compiled on Peripheral-only and Dual-role builds. I'm assuming this was
>>> a Host-only build. Then the problem triggers because drd.o is
>>> unconditionally added to the binary.
>>>
>>> dwc2-y                    := core.o core_intr.o platform.o drd.o
>>>
>>> Is this an old problem or was it triggered by $subject?
>>>
>>
>> I sent a mail yesterday (https://lkml.org/lkml/2020/7/23/114) to warn 
>> about the upcoming v2.
>>
>> This build issue is fixed in the v2 
>> (https://lore.kernel.org/patchwork/project/lkml/list/?series=454729).
>>
> 
> Build issue fixed in v3 instead:
> https://lore.kernel.org/patchwork/project/lkml/list/?series=454936
> 

Drop the previous "Add USB role switch support to DWC2" patchset. I'm 
preparing a new patchset with fixes to address this build issue and 
remarks reported by Martin Blumenstingl.

>> Regards,
>> Amelie
>>
