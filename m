Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AE2A61C6C0F
	for <lists+linux-omap@lfdr.de>; Wed,  6 May 2020 10:43:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728349AbgEFInM (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 6 May 2020 04:43:12 -0400
Received: from szxga06-in.huawei.com ([45.249.212.32]:50458 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727956AbgEFInM (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Wed, 6 May 2020 04:43:12 -0400
Received: from DGGEMS402-HUB.china.huawei.com (unknown [172.30.72.60])
        by Forcepoint Email with ESMTP id A378A75A4B1ED3E052B9;
        Wed,  6 May 2020 16:43:06 +0800 (CST)
Received: from [127.0.0.1] (10.166.213.7) by DGGEMS402-HUB.china.huawei.com
 (10.3.19.202) with Microsoft SMTP Server id 14.3.487.0; Wed, 6 May 2020
 16:43:01 +0800
Subject: Re: [PATCH] ARM: OMAP2+: remove unneeded variable "errata" in
 configure_dma_errata()
To:     Russell King - ARM Linux admin <linux@armlinux.org.uk>
CC:     <tony@atomide.com>, <peter.ujfalusi@ti.com>,
        <linux-omap@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>
References: <20200506061900.19832-1-yanaijie@huawei.com>
 <20200506082941.GA1559@shell.armlinux.org.uk>
From:   Jason Yan <yanaijie@huawei.com>
Message-ID: <c24dfb33-bbce-732e-c242-f4f4e6a1e04f@huawei.com>
Date:   Wed, 6 May 2020 16:43:00 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <20200506082941.GA1559@shell.armlinux.org.uk>
Content-Type: text/plain; charset="gbk"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.166.213.7]
X-CFilter-Loop: Reflected
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org



ÔÚ 2020/5/6 16:29, Russell King - ARM Linux admin Ð´µÀ:
> On Wed, May 06, 2020 at 02:19:00PM +0800, Jason Yan wrote:
>> Fix the following coccicheck warning:
>>
>> arch/arm/mach-omap2/dma.c:82:10-16: Unneeded variable: "errata". Return
>> "0" on line 161
> 
> NAK.  Look closer at what the code is doing, thanks.
> 
> This warning is basically incorrect.
> 

OK, the macro SET_DMA_ERRATA is using this variable.

