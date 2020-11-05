Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6346E2A861A
	for <lists+linux-omap@lfdr.de>; Thu,  5 Nov 2020 19:28:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727017AbgKES2u (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 5 Nov 2020 13:28:50 -0500
Received: from fllv0016.ext.ti.com ([198.47.19.142]:42418 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726996AbgKES2u (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 5 Nov 2020 13:28:50 -0500
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0A5ISfwp072428;
        Thu, 5 Nov 2020 12:28:41 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1604600921;
        bh=A8ke9ygxkQobTu4tGdPyENvgTTTgrNynMtnOsLDg/BY=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=wokZ+ozW0g9OLZobYmfSy1yDs3OyQGl39X16l8rvzm4gjjwIvYotiLSaeZN13i6z3
         bbCp7An0qUq604ce4iR8v9AD1dASk/AN9tJTasM/UK0jW2LspYYWnb0OBULjkw4CXs
         +W/Llj+Vp8XLUFciT8ph21vG4tN6Ra5CfBrsd67U=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0A5ISf2B057150
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 5 Nov 2020 12:28:41 -0600
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Thu, 5 Nov
 2020 12:28:40 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Thu, 5 Nov 2020 12:28:40 -0600
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0A5ISca3105474;
        Thu, 5 Nov 2020 12:28:39 -0600
Subject: Re: [PATCH v3 00/56] Convert DSI code to use drm_mipi_dsi and
 drm_panel
To:     "H. Nikolaus Schaller" <hns@goldelico.com>
CC:     Sebastian Reichel <sre@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Nikhil Devshatwar <nikhil.nd@ti.com>,
        <linux-omap@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        Sekhar Nori <nsekhar@ti.com>, Tony Lindgren <tony@atomide.com>
References: <20201105120333.947408-1-tomi.valkeinen@ti.com>
 <61C04176-4654-4D2D-A55B-31FBB6D2E5AA@goldelico.com>
 <fcbc8488-5861-8e51-0f86-1ed6498083f7@ti.com>
 <579243AA-014A-411B-9014-F5846C9B8137@goldelico.com>
From:   Tomi Valkeinen <tomi.valkeinen@ti.com>
Message-ID: <ab33baff-dd8c-2ee0-6f89-35aa4df7b9cf@ti.com>
Date:   Thu, 5 Nov 2020 20:28:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <579243AA-014A-411B-9014-F5846C9B8137@goldelico.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 05/11/2020 20:14, H. Nikolaus Schaller wrote:
> 
>> Am 05.11.2020 um 18:36 schrieb Tomi Valkeinen <tomi.valkeinen@ti.com>:
>>
>> Hi,
>>
>> On 05/11/2020 19:15, H. Nikolaus Schaller wrote:
>>
>>> Next, I migrated my long waiting mipi_dsi/drm_panel driver conversion for
>>> the panel of the Pyra handheld (omap 5 based) to compile on 5.10-rc2. And
>>> I followed the latest existing panel-orisetech-otm8009a.c which uses a
>>> similar video mode controller and mipi-dsi.
>>>
>>> That one seems to be used by arch/arm/boot/dts/stm32f469-disco.dts.
>>>
>>> Unfortunately my panel driver is not even loaded by drm/omap so I can't
>>> debug. Does this set of drm/omap drivers need a modification of the device
>>> tree? If yes, which one?
>>
>> omapdrm doesn't load the panel drivers. If not even your panel's probe is called, then it hints at
>> DT and/or driver's compatible string issue. The panel's probe should get called even if omapdrm is
>> not loaded at all.
> 
> Well, I use the same device tree that loads the old driver...

Yeah, I was mistaken above. With DSI the panel (may be) a child of the DSI host, so it will affect.

Can you give pointers to the panel driver source and relevant dts files? BOE BTL507212-W677L?

 Tomi

-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
