Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D7F381928B5
	for <lists+linux-omap@lfdr.de>; Wed, 25 Mar 2020 13:43:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727391AbgCYMmz (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 25 Mar 2020 08:42:55 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:36128 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727721AbgCYMmz (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 25 Mar 2020 08:42:55 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 02PCgY6c020259;
        Wed, 25 Mar 2020 07:42:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1585140154;
        bh=ZodhwGdrsapqWjyxp+jOQtmqWBQ1gr/pf3G4XLULXTc=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=khFYJ66rdrbfv0eOeYICjETHfkYkIruHEiV4eruwYVczBQOH1CNKlya/cAzEDOrst
         spmVHpf6XwhUhlXD5E+2FP4gpxPp+etA62Krk2pbNBOsew8u3bt3TkpBCY96bUgBSB
         4knz3FyfU+q3A9Z7Mr+oDIjCddvUmX3b92VUTYXA=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 02PCgYYk041166;
        Wed, 25 Mar 2020 07:42:34 -0500
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Wed, 25
 Mar 2020 07:42:34 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Wed, 25 Mar 2020 07:42:34 -0500
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 02PCgVJl002692;
        Wed, 25 Mar 2020 07:42:32 -0500
Subject: Re: [PATCHv2 03/56] Revert "drm/omap: dss: Remove unused
 omap_dss_device operations"
To:     Sebastian Reichel <sebastian.reichel@collabora.com>,
        Sebastian Reichel <sre@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
CC:     Tony Lindgren <tony@atomide.com>,
        Merlijn Wajer <merlijn@wizzup.org>,
        "H. Nikolaus Schaller" <hns@goldelico.com>,
        Rob Herring <robh@kernel.org>, <linux-omap@vger.kernel.org>,
        <dri-devel@lists.freedesktop.org>, <kernel@collabora.com>
References: <20200224232126.3385250-1-sebastian.reichel@collabora.com>
 <20200224232126.3385250-4-sebastian.reichel@collabora.com>
From:   Tomi Valkeinen <tomi.valkeinen@ti.com>
Message-ID: <5e697fcd-f89d-ad4e-79f7-ae6ffc98be31@ti.com>
Date:   Wed, 25 Mar 2020 14:42:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200224232126.3385250-4-sebastian.reichel@collabora.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi,

On 25/02/2020 01:20, Sebastian Reichel wrote:
> From: Sebastian Reichel <sre@kernel.org>
> 
> This reverts commit 4ff8e98879e6eeae9d125dfcf3b642075d00089d.
> ---
>   drivers/gpu/drm/omapdrm/dss/base.c     | 26 +++++++++++++++
>   drivers/gpu/drm/omapdrm/dss/omapdss.h  |  6 ++++
>   drivers/gpu/drm/omapdrm/omap_encoder.c | 44 +++++++++++++++++++++++---
>   3 files changed, 71 insertions(+), 5 deletions(-)

This is missing description.

  Tomi

-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
