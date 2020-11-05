Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 90C692A8506
	for <lists+linux-omap@lfdr.de>; Thu,  5 Nov 2020 18:37:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726777AbgKERg6 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 5 Nov 2020 12:36:58 -0500
Received: from fllv0015.ext.ti.com ([198.47.19.141]:36824 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726801AbgKERg4 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 5 Nov 2020 12:36:56 -0500
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0A5Hakv5068530;
        Thu, 5 Nov 2020 11:36:46 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1604597806;
        bh=iBFlngXAF4yFVCvB1gu3ziOuR0nSCh3CyqVTedhaoE0=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=XvfzO7b6WIfl3bn/gcyoyV+R9buEXFp+AmK86sTPJFrncY402HpOq4h75/pteomt3
         Ynuw7aJF0CPOeNTfzje5fVBce38ibS4bi7Mm1/fxM6TCHYQRUDCbLaN3l9Td2JGffN
         YuLKjWFPDVWrkizv8RweIg4AtO4LWRoJOZ5TZLoA=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0A5HakPF120383
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 5 Nov 2020 11:36:46 -0600
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Thu, 5 Nov
 2020 11:36:45 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Thu, 5 Nov 2020 11:36:45 -0600
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0A5Hah09067002;
        Thu, 5 Nov 2020 11:36:43 -0600
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
From:   Tomi Valkeinen <tomi.valkeinen@ti.com>
Message-ID: <fcbc8488-5861-8e51-0f86-1ed6498083f7@ti.com>
Date:   Thu, 5 Nov 2020 19:36:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <61C04176-4654-4D2D-A55B-31FBB6D2E5AA@goldelico.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi,

On 05/11/2020 19:15, H. Nikolaus Schaller wrote:

> Next, I migrated my long waiting mipi_dsi/drm_panel driver conversion for
> the panel of the Pyra handheld (omap 5 based) to compile on 5.10-rc2. And
> I followed the latest existing panel-orisetech-otm8009a.c which uses a
> similar video mode controller and mipi-dsi.
> 
> That one seems to be used by arch/arm/boot/dts/stm32f469-disco.dts.
> 
> Unfortunately my panel driver is not even loaded by drm/omap so I can't
> debug. Does this set of drm/omap drivers need a modification of the device
> tree? If yes, which one?

omapdrm doesn't load the panel drivers. If not even your panel's probe is called, then it hints at
DT and/or driver's compatible string issue. The panel's probe should get called even if omapdrm is
not loaded at all.

Can you push your branch somewhere, so I can have a quick look?

 Tomi

-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
