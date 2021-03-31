Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1450234FC18
	for <lists+linux-omap@lfdr.de>; Wed, 31 Mar 2021 11:04:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234473AbhCaJDi (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 31 Mar 2021 05:03:38 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:15121 "EHLO
        szxga04-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234471AbhCaJDg (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 31 Mar 2021 05:03:36 -0400
Received: from DGGEMS410-HUB.china.huawei.com (unknown [172.30.72.60])
        by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4F9L094QTlz1BFxn;
        Wed, 31 Mar 2021 17:01:29 +0800 (CST)
Received: from [10.67.100.236] (10.67.100.236) by
 DGGEMS410-HUB.china.huawei.com (10.3.19.210) with Microsoft SMTP Server id
 14.3.498.0; Wed, 31 Mar 2021 17:03:24 +0800
Subject: Re: [PATCH -next] ARM: OMAP: Use DEFINE_SPINLOCK() for spinlock
To:     Tony Lindgren <tony@atomide.com>
CC:     Aaro Koskinen <aaro.koskinen@iki.fi>,
        Russell King <linux@armlinux.org.uk>, <heying24@huawei.com>,
        <yuehaibing@huawei.com>, <weiyongjun1@huawei.com>,
        <johnny.chenyi@huawei.com>, <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <linux-omap@vger.kernel.org>,
        <kernel-janitors@vger.kernel.org>
References: <20210327095227.105081-1-chenlifu@huawei.com>
 <YGQPx5UMmHnFoJi+@atomide.com>
From:   chenlifu <chenlifu@huawei.com>
Message-ID: <32b58df3-7ff0-abf5-cff7-eaf35dffb292@huawei.com>
Date:   Wed, 31 Mar 2021 17:03:24 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <YGQPx5UMmHnFoJi+@atomide.com>
Content-Type: text/plain; charset="gbk"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.67.100.236]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org


ÔÚ 2021/3/31 13:59, Tony Lindgren Ð´µÀ:
> * Chen Lifu <chenlifu@huawei.com> [210327 11:53]:
>> From: Lifu Chen <chenlifu@huawei.com>
>>
>> spinlock can be initialized automatically with DEFINE_SPINLOCK()
>> rather than explicitly calling spin_lock_init().
> 
> Thanks applying into omap-for-v5.13/soc.
> 
> Tony
> .
> 

Thanks!

---
Chen Lifu
