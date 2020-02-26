Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9580016FEC7
	for <lists+linux-omap@lfdr.de>; Wed, 26 Feb 2020 13:21:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727107AbgBZMVL (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 26 Feb 2020 07:21:11 -0500
Received: from lelv0143.ext.ti.com ([198.47.23.248]:54786 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726996AbgBZMVL (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 26 Feb 2020 07:21:11 -0500
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 01QCKmbi123963;
        Wed, 26 Feb 2020 06:20:48 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1582719648;
        bh=qlL4/NrEVczHiHEVcaPdYRtPNX+h7wkHeQ1TLgT5TlY=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=j+TULsTvk2t2CfX6AltqpL5mwQzkeg3k+r+vOsXM7q/HkoPsMMJ0VaVyRbbyozWLr
         CNoFZVsEwmjETPvFRLdELVsemIb/IG7TNdGDmy8iEbMjRXTg/6L+NLLbKgNK7h8VYC
         HX4ZT7J3SsEYeWxZfnFPb46rb7wenCuPP8PAeXM4=
Received: from DFLE107.ent.ti.com (dfle107.ent.ti.com [10.64.6.28])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 01QCKmYM089759
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 26 Feb 2020 06:20:48 -0600
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Wed, 26
 Feb 2020 06:20:48 -0600
Received: from localhost.localdomain (10.64.41.19) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Wed, 26 Feb 2020 06:20:48 -0600
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
        by localhost.localdomain (8.15.2/8.15.2) with ESMTP id 01QCKkej041497;
        Wed, 26 Feb 2020 06:20:46 -0600
Subject: Re: [PATCHv2 00/56] drm/omap: Convert DSI code to use drm_mipi_dsi
 and drm_panel
To:     Sebastian Reichel <sre@kernel.org>,
        Tony Lindgren <tony@atomide.com>
CC:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Merlijn Wajer <merlijn@wizzup.org>,
        "H. Nikolaus Schaller" <hns@goldelico.com>,
        Rob Herring <robh@kernel.org>, <linux-omap@vger.kernel.org>,
        <dri-devel@lists.freedesktop.org>, <kernel@collabora.com>
References: <20200224232126.3385250-1-sebastian.reichel@collabora.com>
 <20200225001011.GF37466@atomide.com>
 <20200225022822.wh7omykthv7skojy@earth.universe>
 <20200225154237.GH37466@atomide.com>
 <20200225230124.fkt35ihyjnokb2ng@earth.universe>
 <20200225230937.GL37466@atomide.com>
 <20200225235243.dr2apisbxzugj34u@earth.universe>
From:   Tomi Valkeinen <tomi.valkeinen@ti.com>
Message-ID: <fb8d5060-251d-a4b2-6250-2a4f10e1bb9a@ti.com>
Date:   Wed, 26 Feb 2020 14:20:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200225235243.dr2apisbxzugj34u@earth.universe>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 26/02/2020 01:52, Sebastian Reichel wrote:

> Well for now let's get Laurent's and my series forward. I think
> the next step would be to get rid of omap_encoder by moving the
> encoder init into the DSS output code. Technically we are already
> merging omapdrm and omapdss, e.g. omap_connector is gone from
> omapdrm after the series.

After Laurent's series (now pushed) and this one, we can turn omapdrm into a single module, as it's 
supposed to be.

I don't see a point in trying to change DSS internal encoders into separate modules, as they're all 
under DSS, and at times connected in ways which are not easily represented with generic APIs. In 
theory it should be possible, but I don't see any real benefit in such work.

  Tomi

-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
