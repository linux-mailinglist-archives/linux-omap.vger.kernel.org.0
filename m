Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 941211E6748
	for <lists+linux-omap@lfdr.de>; Thu, 28 May 2020 18:18:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404991AbgE1QSk (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 28 May 2020 12:18:40 -0400
Received: from userp2130.oracle.com ([156.151.31.86]:55740 "EHLO
        userp2130.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2404990AbgE1QSj (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 28 May 2020 12:18:39 -0400
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
        by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 04SGHfr5120043;
        Thu, 28 May 2020 16:18:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=corp-2020-01-29;
 bh=yXhlfTDcwelB/DWozshQ2Q4mBm73Gyb3DedaaAJLi9s=;
 b=CXjVmR4f0ZBsAeQ6bSaNL+eln6S+xQjGJiGhz1KtKMXtpJeqAjia7cdTtNJydEzCJv+7
 h+wm5DiLvcIMn/Wi3x/jg4kS4EDytH1eClXR+dJfoysCbAeOVmxF+50rdhjtcSA3JtOo
 6W8ebsaW4eHUSV5VoLq4Zu/HeWLCtwPSFD2x5YrN3IeMfT1qEPE1wnitFDBHCSslSRIS
 fvQaZ5/HsvukMb5g3xd1AFfqieJ+iq7OwvUNr7VKrPCjz/k7NB5BBQ8lfSNQI6MprClg
 QZJFdT9rV3Ik1v2vdKZpy2NjQXtdYQ76DLZMHvse5f0Nlb0CoMr5uGbDG78LTEvmgtQr Tg== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
        by userp2130.oracle.com with ESMTP id 316u8r5ycq-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 28 May 2020 16:18:16 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
        by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 04SGHfms176357;
        Thu, 28 May 2020 16:18:15 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
        by userp3020.oracle.com with ESMTP id 31a9kssdks-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 28 May 2020 16:18:15 +0000
Received: from abhmp0010.oracle.com (abhmp0010.oracle.com [141.146.116.16])
        by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 04SGI9Hw026661;
        Thu, 28 May 2020 16:18:09 GMT
Received: from [10.74.108.155] (/10.74.108.155)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Thu, 28 May 2020 09:18:08 -0700
Subject: Re: [PATCH] ARM: omap2: drop broken broadcast timer hack
To:     Tony Lindgren <tony@atomide.com>, Arnd Bergmann <arnd@arndb.de>
Cc:     arm@kernel.org, Rob Herring <robh@kernel.org>,
        Grygorii Strashko <grygorii.strashko@ti.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Lokesh Vutla <lokeshvutla@ti.com>, Keerthy <j-keerthy@ti.com>,
        linux-kernel@vger.kernel.org, Tero Kristo <t-kristo@ti.com>,
        Olof Johansson <olof@lixom.net>, linux-omap@vger.kernel.org,
        afzal mohammed <afzal.mohd.ma@gmail.com>,
        linux-arm-kernel@lists.infradead.org
References: <20200528091923.2951100-1-arnd@arndb.de>
 <20200528134621.GN37466@atomide.com> <20200528135057.GO37466@atomide.com>
 <20200528155759.GP37466@atomide.com>
From:   santosh.shilimkar@oracle.com
Organization: Oracle Corporation
Message-ID: <34e8fb61-b452-529b-b2c6-3849b2395096@oracle.com>
Date:   Thu, 28 May 2020 09:18:05 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:60.0)
 Gecko/20100101 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20200528155759.GP37466@atomide.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9635 signatures=668686
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 mlxscore=0 adultscore=0
 mlxlogscore=999 malwarescore=0 spamscore=0 bulkscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2004280000
 definitions=main-2005280112
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9635 signatures=668686
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 mlxscore=0
 priorityscore=1501 spamscore=0 cotscore=-2147483648 suspectscore=0
 phishscore=0 clxscore=1011 mlxlogscore=999 bulkscore=0 adultscore=0
 lowpriorityscore=0 impostorscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2004280000 definitions=main-2005280112
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 5/28/20 8:57 AM, Tony Lindgren wrote:
> * Tony Lindgren <tony@atomide.com> [200528 13:51]:
>> * Tony Lindgren <tony@atomide.com> [200528 13:47]:
>>> * Arnd Bergmann <arnd@arndb.de> [200528 09:20]:
>>>> The OMAP4 timer code had a special hack for using the broadcast timer
>>>> without SMP. Since the dmtimer is now gone, this also needs to be dropped
>>>> to avoid a link failure for non-SMP AM43xx configurations:
>>>>
>>>> kernel/time/tick-broadcast.o: in function `tick_device_uses_broadcast':
>>>> tick-broadcast.c:(.text+0x130): undefined reference to `tick_broadcast'
>>>
>>> Hmm this sounds like a regression though. Isn't this needed for using
>>> the ARM local timers on non-SMP SoC, so a separate timer from dmtimer?
>>>
>>> I've probably removed something accidentally to cause this.
>>
>> Sounds like arch/arm/mach-omap2/Makefile change needs to be removed
>> to always still build in timer.o. And probably timer.c needs back
>> the ifdef for CONFIG_SOC_HAS_REALTIME_COUNTER.
>>
>> I'll take a look today.
> 
> I've sent a patch along those lines as:
> 
> [PATCH] ARM: OMAP2+: Fix regression for using local timer on non-SMP SoCs
> 
> A link for the patch at [0] below.
> 
CPU local timers not being in always ON power domain use to be the
reason on early version of the SOCs but later SOC moved the CPU local
timer also in always on domain. Probably AM43xx does loose local timer
on CPU PD in low power so yes broadcast would be needed with dmtimer
help.

> 
> [0] https://lore.kernel.org/linux-omap/20200528155453.8585-1-tony@atomide.com/T/#u
> 
This should restore it.

Regards,
Santosh
