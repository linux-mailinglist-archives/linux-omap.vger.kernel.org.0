Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8DE989CB2B
	for <lists+linux-omap@lfdr.de>; Mon, 26 Aug 2019 10:00:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730136AbfHZIAg (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 26 Aug 2019 04:00:36 -0400
Received: from lelv0142.ext.ti.com ([198.47.23.249]:34146 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728233AbfHZIAg (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 26 Aug 2019 04:00:36 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x7Q80NDQ114534;
        Mon, 26 Aug 2019 03:00:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1566806423;
        bh=49aC23UcYQ4csP+556MKJUVYmtJJlMk4hmn+NUlvgw0=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=OtMRk7FJKfykpqRIrFgKs76I5XJKWrX5/0UZHPOu63HBOyahYpKPRgKder+6GRH5o
         YgdJEw8gpg4YDrk4WaVDfT3Cvam/2ddEPLFCKKRdzWhx0mWsW92KebbYAM28ymG940
         7IufPH1TDcSwVIpVncpBhnOqhBzj2GK3f3Km/+BM=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x7Q80N6Y121067
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 26 Aug 2019 03:00:23 -0500
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Mon, 26
 Aug 2019 03:00:23 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Mon, 26 Aug 2019 03:00:23 -0500
Received: from [127.0.0.1] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x7Q80Lqm096610;
        Mon, 26 Aug 2019 03:00:22 -0500
Subject: Re: OMAP3 ROM RNG probe failure on N900
To:     Aaro Koskinen <aaro.koskinen@iki.fi>,
        Tony Lindgren <tony@atomide.com>,
        =?UTF-8?Q?Pali_Roh=c3=a1r?= <pali.rohar@gmail.com>
CC:     <linux-omap@vger.kernel.org>
References: <20190823214655.GH30291@darkstar.musicnaut.iki.fi>
From:   Tero Kristo <t-kristo@ti.com>
Message-ID: <7d195797-085e-3bcc-933e-dca71dc12364@ti.com>
Date:   Mon, 26 Aug 2019 11:00:21 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190823214655.GH30291@darkstar.musicnaut.iki.fi>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 24.8.2019 0.46, Aaro Koskinen wrote:
> Hi,
> 
> I was looking at N900 boot logs from the current mainline (v5.3-rc),
> and noticed this:
> 
> [    3.297668] omap3_rom_rng: initializing
> [    3.301940] omap3_rom_rng: unable to get RNG clock
> [    3.307006] omap3-rom-rng: probe of omap3-rom-rng failed with error -2
>
> It seems some clock data was deleted with 0ed266d7ae5e ("clk: ti: omap3:
> cleanup unnecessary clock aliases"), including one for omap3-rom-rng.
> How this driver is supposed to work now? I guess it has been broken for
> a while. :-(

You should have a DT node for the device, which contains the clock handle.

-Tero
--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
