Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 71CDD1928D6
	for <lists+linux-omap@lfdr.de>; Wed, 25 Mar 2020 13:48:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727384AbgCYMsB (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 25 Mar 2020 08:48:01 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:45790 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727360AbgCYMsB (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 25 Mar 2020 08:48:01 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 02PClpao071098;
        Wed, 25 Mar 2020 07:47:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1585140471;
        bh=zVI/Q7EZLIzoVYtzNBKAuZzWgH2n9DgZgVTegR8IAiQ=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=Ilv2anfPuV4S/E2R0g2+uvnkaQCiX0VJ47JBkmJGRy1rJ9kyWCWvKkOKH2QI315H7
         X5wCA64OVpAFZHLbFcIlt04PUMMFYtDYDad1i2dAHQSa2T1aTHTzmUSFs5qwbnPg4I
         3g6VzYmEoDm7yW7Ser4Y8cvTEIBrxR12y11OI6Qg=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 02PClpdD049005;
        Wed, 25 Mar 2020 07:47:51 -0500
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Wed, 25
 Mar 2020 07:47:50 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Wed, 25 Mar 2020 07:47:50 -0500
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 02PClmTi012341;
        Wed, 25 Mar 2020 07:47:49 -0500
Subject: Re: [PATCHv2 00/56] drm/omap: Convert DSI code to use drm_mipi_dsi
 and drm_panel
To:     Sebastian Reichel <sebastian.reichel@collabora.com>,
        Sebastian Reichel <sre@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
CC:     Tony Lindgren <tony@atomide.com>,
        Merlijn Wajer <merlijn@wizzup.org>,
        "H. Nikolaus Schaller" <hns@goldelico.com>,
        Rob Herring <robh@kernel.org>, <linux-omap@vger.kernel.org>,
        <dri-devel@lists.freedesktop.org>, <kernel@collabora.com>
References: <20200224232126.3385250-1-sebastian.reichel@collabora.com>
From:   Tomi Valkeinen <tomi.valkeinen@ti.com>
Message-ID: <32b73b0a-a5f6-e311-b2d5-95e333f039a4@ti.com>
Date:   Wed, 25 Mar 2020 14:47:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200224232126.3385250-1-sebastian.reichel@collabora.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 25/02/2020 01:20, Sebastian Reichel wrote:
> This updates the existing omapdrm DSI code, so that it uses
> common drm_mipi_dsi API and drm_panel.
> 
> The patchset has been tested with Droid 4 using Linux console, X.org and
> Weston. The patchset is based on Laurent Pinchartl's patch series [0]
> and removes the last custom panel driver, so quite a few cleanups on the
> omapdrm codebase were possible.

This is a big series, and I suggest to keep the cleanups to minimum. Things can be cleaned up 
afterwards after the functional parts of this series have been merged.

  Tomi


-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
