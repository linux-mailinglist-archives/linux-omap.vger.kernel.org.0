Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4EFD722C056
	for <lists+linux-omap@lfdr.de>; Fri, 24 Jul 2020 09:59:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726686AbgGXH7l (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 24 Jul 2020 03:59:41 -0400
Received: from mx08-00178001.pphosted.com ([91.207.212.93]:52380 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726567AbgGXH7k (ORCPT
        <rfc822;linux-omap@vger.kernel.org>);
        Fri, 24 Jul 2020 03:59:40 -0400
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 06O7vOEV008456;
        Fri, 24 Jul 2020 09:59:28 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=STMicroelectronics;
 bh=BXRpKNkSjMIUyjkajSPGDlyogS1QlT0Sg1ozOIjW8RU=;
 b=zlqhAvXl7B+L31TK5f4bEJkXUl7Cmbi6DowgVIE/NRqU1EH8TQzXeQECVb8fg6fnVrvU
 hDD6TZNp9np2HoAd8BEDDHYBOlVADiYnP99PydvLtJr74x7EkTPGwft1AIO/pj/fLaeK
 IcJxwp7bEi1nFjtQydg585QTsH/MPYHvLdNQS4m8HjLwtERNhHgl/srn/LlGogUH6rFm
 PBW4Ut8jCp+EHihzlwOq8NQZC+NtTCBHsIuSNccdv1ipY0Sd+C1yLQwXa4FROHhciDbk
 URQD9cjnzFkzxbPruY2RGQtKlgO7+XRtr9iC61XxKy+EE2MY1l5A9oXS/0LtkF/b1MCC Uw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 32bsahf2y8-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 24 Jul 2020 09:59:28 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 64B2D10002A;
        Fri, 24 Jul 2020 09:59:27 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 4D715221504;
        Fri, 24 Jul 2020 09:59:27 +0200 (CEST)
Received: from lmecxl0995.lme.st.com (10.75.127.46) by SFHDAG3NODE2.st.com
 (10.75.127.8) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Fri, 24 Jul
 2020 09:59:26 +0200
Subject: Re: [balbi-usb:testing/next 1/39] drivers/usb/dwc2/drd.c:80:36:
 error: 'struct dwc2_hsotg' has no member named 'test_mode'
To:     Felipe Balbi <balbi@kernel.org>, kernel test robot <lkp@intel.com>,
        Minas Harutyunyan <hminas@synopsys.com>
CC:     "kbuild-all@lists.01.org" <kbuild-all@lists.01.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>
References: <202007241311.MMbsxewn%lkp@intel.com> <875zadnyek.fsf@kernel.org>
From:   Amelie DELAUNAY <amelie.delaunay@st.com>
Message-ID: <8098bdd6-9de2-dfdf-1e50-b027296ea254@st.com>
Date:   Fri, 24 Jul 2020 09:59:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <875zadnyek.fsf@kernel.org>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG5NODE1.st.com (10.75.127.13) To SFHDAG3NODE2.st.com
 (10.75.127.8)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235,18.0.687
 definitions=2020-07-24_02:2020-07-24,2020-07-24 signatures=0
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi Felipe,

On 7/24/20 9:51 AM, Felipe Balbi wrote:
> kernel test robot <lkp@intel.com> writes:
> 
>> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/balbi/usb.git testing/next
>> head:   74dbc49b08d37ed9d4fd440d8896626733f80564
>> commit: bc0f0d4a5853e32ba97a0318f774570428fc5634 [1/39] usb: dwc2: override PHY input signals with usb role switch support
>> config: nios2-randconfig-r002-20200724 (attached as .config)
>> compiler: nios2-linux-gcc (GCC) 9.3.0
>> reproduce (this is a W=1 build):
>>          wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>>          chmod +x ~/bin/make.cross
>>          git checkout bc0f0d4a5853e32ba97a0318f774570428fc5634
>>          # save the attached .config to linux build tree
>>          COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-9.3.0 make.cross ARCH=nios2
>>
>> If you fix the issue, kindly add following tag as appropriate
>> Reported-by: kernel test robot <lkp@intel.com>
>>
>> All errors (new ones prefixed by >>):
>>
>>     drivers/usb/dwc2/drd.c: In function 'dwc2_drd_role_sw_set':
>>>> drivers/usb/dwc2/drd.c:80:36: error: 'struct dwc2_hsotg' has no member named 'test_mode'
>>        80 |  if (role == USB_ROLE_NONE && hsotg->test_mode) {
> 
> weird, this compiled just fine here with allmodconfig on AArch64.
> 
> /me goes check. Oh, I see what's happening, hsotg->test_mode is only
> compiled on Peripheral-only and Dual-role builds. I'm assuming this was
> a Host-only build. Then the problem triggers because drd.o is
> unconditionally added to the binary.
> 
> dwc2-y					:= core.o core_intr.o platform.o drd.o
> 
> Is this an old problem or was it triggered by $subject?
> 

I sent a mail yesterday (https://lkml.org/lkml/2020/7/23/114) to warn 
about the upcoming v2.

This build issue is fixed in the v2 
(https://lore.kernel.org/patchwork/project/lkml/list/?series=454729).

Regards,
Amelie

