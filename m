Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 780D22C6817
	for <lists+linux-omap@lfdr.de>; Fri, 27 Nov 2020 15:45:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730944AbgK0OpI (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 27 Nov 2020 09:45:08 -0500
Received: from fllv0015.ext.ti.com ([198.47.19.141]:60272 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730767AbgK0OpI (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 27 Nov 2020 09:45:08 -0500
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0AREj2UH020321;
        Fri, 27 Nov 2020 08:45:02 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1606488302;
        bh=0mbme5qWlu/L3anxZeEvUdVgT3+APPWJpefDWXm0sus=;
        h=Date:From:To:CC:Subject:References:In-Reply-To;
        b=uFNaHs7AUYKCcTeybwSEYlsHhiRTjMYStAhctlAxtFW2gx6I72bTzhlbY3lZL/ekv
         QV5p6XX0zAEFs6WNrkUGaLepeOXDt1fUhjIDoUr0SvJ/BX7kkmfmDVEB9Oo/KHC2hq
         E6tNCZZKnkIbuZqOdhllRVK4ewx+0f9iQmTLtcxk=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0AREj2Mn117850
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Fri, 27 Nov 2020 08:45:02 -0600
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Fri, 27
 Nov 2020 08:45:02 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Fri, 27 Nov 2020 08:45:02 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0AREj2uY056263;
        Fri, 27 Nov 2020 08:45:02 -0600
Date:   Fri, 27 Nov 2020 08:45:02 -0600
From:   Nishanth Menon <nm@ti.com>
To:     Tony Lindgren <tony@atomide.com>
CC:     <linux-omap@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH] ARM: OMAP2+: Fix am4 only build after genpd changes
Message-ID: <20201127144502.of7okggrpvf5rbtz@evaluate>
References: <20201127063245.62153-1-tony@atomide.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20201127063245.62153-1-tony@atomide.com>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 08:32-20201127, Tony Lindgren wrote:
> With commit df6c2ec872a6 ("ARM: OMAP2+: Drop legacy remaining legacy
> platform data for am4") we moved am4 to boot with simple-pm-bus using
> genpd and devicetree based data. But I forgot to test am4 only build
> that still has few references to the old platform data left, and cause
> undefined reference errors with omap_hwmod_set_postsetup_state and
> omap_hwmod_for_each. We can just drop the related calls for am4 now,
> and also drop the references to unused struct wkup_m3_platform_data.
> 
> Reported-by: Nishanth Menon <nm@ti.com>
> Signed-off-by: Tony Lindgren <tony@atomide.com>
> ---
> 
> I'm applying this into omap-for-v5.11/genpd branch to fix build for
> am4 config.


Thanks Tony.

Tested-by: Nishanth Menon <nm@ti.com>

Tested against next-20201127 with .config
https://pastebin.ubuntu.com/p/qYwWH9FhW6/

[...]
-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D
