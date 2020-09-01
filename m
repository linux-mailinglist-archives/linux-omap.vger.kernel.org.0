Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 643EB25889D
	for <lists+linux-omap@lfdr.de>; Tue,  1 Sep 2020 08:58:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726112AbgIAG6I (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 1 Sep 2020 02:58:08 -0400
Received: from szxga07-in.huawei.com ([45.249.212.35]:45332 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726085AbgIAG6H (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 1 Sep 2020 02:58:07 -0400
Received: from DGGEMS405-HUB.china.huawei.com (unknown [172.30.72.60])
        by Forcepoint Email with ESMTP id E5F782469EB139DBFF69;
        Tue,  1 Sep 2020 14:58:03 +0800 (CST)
Received: from [127.0.0.1] (10.174.179.108) by DGGEMS405-HUB.china.huawei.com
 (10.3.19.205) with Microsoft SMTP Server id 14.3.487.0; Tue, 1 Sep 2020
 14:58:00 +0800
Subject: Re: [PATCH -next] memory: omap-gpmc: Fix -Wunused-function warnings
To:     Krzysztof Kozlowski <krzk@kernel.org>
References: <20200901035642.22772-1-yuehaibing@huawei.com>
 <20200901065241.GA7720@kozik-lap>
CC:     <rogerq@ti.com>, <tony@atomide.com>, <linux-omap@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
From:   Yuehaibing <yuehaibing@huawei.com>
Message-ID: <a8b622ac-eb41-1371-9514-f4a31dc6589d@huawei.com>
Date:   Tue, 1 Sep 2020 14:58:00 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:45.0) Gecko/20100101
 Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <20200901065241.GA7720@kozik-lap>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.174.179.108]
X-CFilter-Loop: Reflected
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 2020/9/1 14:52, Krzysztof Kozlowski wrote:
> On Tue, Sep 01, 2020 at 11:56:42AM +0800, YueHaibing wrote:
>> drivers/memory/omap-gpmc.c:987:12: warning: ‘gpmc_cs_remap’ defined but not used [-Wunused-function]
>>  static int gpmc_cs_remap(int cs, u32 base)
>>             ^~~~~~~~~~~~~
>> drivers/memory/omap-gpmc.c:926:20: warning: ‘gpmc_cs_get_name’ defined but not used [-Wunused-function]
>>  static const char *gpmc_cs_get_name(int cs)
>>                     ^~~~~~~~~~~~~~~~
>> drivers/memory/omap-gpmc.c:919:13: warning: ‘gpmc_cs_set_name’ defined but not used [-Wunused-function]
>>  static void gpmc_cs_set_name(int cs, const char *name)
>>              ^~~~~~~~~~~~~~~~
>> Make them as  __maybe_unused to fix this.
> 
> Hi,
> 
> Do you know what configuration triggers these warnings? What has to be
> disabled (e.g. CONFIG_OF)? Such information is useful in the commit
> message.

Yes, this is triggered by disable CONFIG_OF, I will update the commit log.
> 
> Best regards,
> Krzysztof
> 
> .
> 

