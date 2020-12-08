Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 31BE62D2E95
	for <lists+linux-omap@lfdr.de>; Tue,  8 Dec 2020 16:47:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730174AbgLHPqx (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 8 Dec 2020 10:46:53 -0500
Received: from fllv0016.ext.ti.com ([198.47.19.142]:50284 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729818AbgLHPqw (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 8 Dec 2020 10:46:52 -0500
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0B8Fj3HH006507;
        Tue, 8 Dec 2020 09:45:03 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1607442303;
        bh=pS7B1k3rjKyiSxmF4rNmez+ZpHBPaw0uzbbVeS112qY=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=rH3lAEIKXflQRZksTk2YLIATCCGTAW6LJUn9BFu9qZR69S0iORswAYjSOvow5m6zH
         anHAOYMww6Gj5565rmsvIjfIMU+ZDZ1ky8/F6VHOcz2Jp1Euu/XolC4Lee7t4fyAoZ
         avvLnBmZzPDLUGCI1rn3r8PJWB8FaRLvfKYUIew4=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0B8Fj2Hj018330
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 8 Dec 2020 09:45:03 -0600
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 8 Dec
 2020 09:45:03 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 8 Dec 2020 09:45:03 -0600
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0B8Fj0OE071478;
        Tue, 8 Dec 2020 09:45:01 -0600
Subject: Re: [PATCH v5 11/29] drm/omap: dsi: pass vc to various functions
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
CC:     Sebastian Reichel <sre@kernel.org>,
        Nikhil Devshatwar <nikhil.nd@ti.com>,
        <dri-devel@lists.freedesktop.org>, <linux-omap@vger.kernel.org>,
        Sekhar Nori <nsekhar@ti.com>, Tony Lindgren <tony@atomide.com>,
        <hns@goldelico.com>, Sam Ravnborg <sam@ravnborg.org>
References: <20201208122855.254819-1-tomi.valkeinen@ti.com>
 <20201208122855.254819-12-tomi.valkeinen@ti.com>
 <X8+eEwNnvSolerN3@pendragon.ideasonboard.com>
From:   Tomi Valkeinen <tomi.valkeinen@ti.com>
Message-ID: <a521f827-ef2a-669d-13e2-48acab25a803@ti.com>
Date:   Tue, 8 Dec 2020 17:45:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <X8+eEwNnvSolerN3@pendragon.ideasonboard.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 08/12/2020 17:38, Laurent Pinchart wrote:
> Hi Tomi,
> 
> Thank you for the patch.
> 
> On Tue, Dec 08, 2020 at 02:28:37PM +0200, Tomi Valkeinen wrote:
>> To start fixing the issues related to channels and vcs described in the
>> previous commit, pass vc to various functions which will need it do
>> properly handle different DSI channels and VCs.
> 
> This is a bit hard to review as you add the OMAP DSI VC as a parameter
> (named vc) to some functions , and the MIPI DSI virtual channel as a
> parameter (named channel) to other functions. Only the former matches
> the commit message. Splitting this in two would make the changes

Ah, that's true. I'll update the title and desc to mention channel too.

 Tomi

-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
