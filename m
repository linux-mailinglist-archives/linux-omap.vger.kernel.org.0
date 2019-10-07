Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1D07ACE53A
	for <lists+linux-omap@lfdr.de>; Mon,  7 Oct 2019 16:29:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727490AbfJGO3x (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 7 Oct 2019 10:29:53 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:58564 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726334AbfJGO3x (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 7 Oct 2019 10:29:53 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x97ETOAJ036075;
        Mon, 7 Oct 2019 09:29:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1570458564;
        bh=PG51P+fRN0Li8qnqF66zYDUyUyJJyL6KBk3a4211uss=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=vBWXUXEMjVMQLU4OXY6lPd0Ftvui3MRu4YzPSrpaSNlutfAxLrv9f5g1oqlY8aiYE
         ZXx44HY6sivNhZltYBOD7LBKlNHg+311ZRPweOt5UoGjdKUBupbpdKOIrY5zetWi2s
         zNd3mbToshhDlirrnJOVU8keoHrg+OyeGt41/WG0=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id x97ETOI4009904;
        Mon, 7 Oct 2019 09:29:24 -0500
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Mon, 7 Oct
 2019 09:29:23 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Mon, 7 Oct 2019 09:29:23 -0500
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x97ETLtD017644;
        Mon, 7 Oct 2019 09:29:22 -0500
Subject: Re: [Letux-kernel] [PATCH] ARM: omap2plus_defconfig: Fix selected
 panels after generic panel changes
To:     Andreas Kemnade <andreas@kemnade.info>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
CC:     Discussions about the Letux Kernel <letux-kernel@openphoenux.org>,
        Tony Lindgren <tony@atomide.com>, Jyri Sarha <jsarha@ti.com>,
        Linux-OMAP <linux-omap@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
References: <20191003165539.50318-1-tony@atomide.com>
 <03ca02c1-2816-17cd-03fd-5b72e5d0ec96@ti.com>
 <39E48EC6-65FE-419B-BBE8-E72CB44B517D@goldelico.com>
 <20191006145348.GD4740@pendragon.ideasonboard.com>
 <20191006223958.67725fdf@aktux> <20191007064035.72016c78@aktux>
From:   Tomi Valkeinen <tomi.valkeinen@ti.com>
Message-ID: <654d00a7-d802-d116-84c4-7c614d0fe272@ti.com>
Date:   Mon, 7 Oct 2019 17:29:20 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20191007064035.72016c78@aktux>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 07/10/2019 07:40, Andreas Kemnade wrote:

>>> That's really weird, the driver name, the SPI device table and the OF
>>> device table are the same (except for the "omapdss," prefix that we
>>> don't add anymore in omapdss-boot-init.c). Would you be able to
>>> investigate what broke ?
>>>    
>> in earlier times:
>>
>> root@gta04:/sys/bus/spi/devices/spi4.0# cat modalias
>> spi:tpo,td028ttec1
>>
>> now in 5.4-rc1:
>> root@gta04:/sys/bus/spi/devices/spi4.0# cat modalias
>> spi:td028ttec1
>>
>> root@gta04:~# modinfo /lib/modules/5.4.0-rc1-letux+/kernel/drivers/gpu/drm/panel/panel-tpo-td028ttec1.ko
>> filename:       /lib/modules/5.4.0-rc1-letux+/kernel/drivers/gpu/drm/panel/panel-tpo-td028ttec1.ko
>> license:        GPL
>> description:    Toppoly TD028TTEC1 panel driver
>> author:         H. Nikolaus Schaller <hns@goldelico.com>
>> srcversion:     6B3E224BCD3D76253CF361C
>> alias:          of:N*T*Ctoppoly,td028ttec1C*
>> alias:          of:N*T*Ctoppoly,td028ttec1
>> alias:          of:N*T*Ctpo,td028ttec1C*
>> alias:          of:N*T*Ctpo,td028ttec1
>> alias:          spi:toppoly,td028ttec1
>> alias:          spi:tpo,td028ttec1
>> depends:        drm
>> intree:         Y
>> name:           panel_tpo_td028ttec1
>> vermagic:       5.4.0-rc1-letux+ SMP preempt mod_unload ARMv7 p2v8
>>
>> That alias is not in the list.
>>
> some more research:
> in former times
> of_modalias_node() has stripped the omapdss prefix, result: modalias=spi:tpo,td028ttec1
> now it strips the tpo prefix because there is no omapdss prefix anymore.

I haven't studied this more yet, but yes, I can see of_modalias_node 
stripping the vendor prefix on purpose. I do wonder how this is supposed 
to work, it would make more sense to me to keep the vendor prefix.

Is the spi_device_id supposed to be without vendor prefix? With a quick 
grep, this seems to be the case.

  Tomi

-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
