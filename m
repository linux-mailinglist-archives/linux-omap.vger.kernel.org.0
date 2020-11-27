Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DD8ED2C6118
	for <lists+linux-omap@lfdr.de>; Fri, 27 Nov 2020 09:45:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728114AbgK0Inl (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 27 Nov 2020 03:43:41 -0500
Received: from fllv0015.ext.ti.com ([198.47.19.141]:42812 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727742AbgK0Ink (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 27 Nov 2020 03:43:40 -0500
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0AR8hV57029011;
        Fri, 27 Nov 2020 02:43:31 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1606466611;
        bh=aMzyk4R1VkVqE8u8Y1gkJ93UmYRtvSDrJWJA3BazLBI=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=eiXc00S9zlRjJ3t94onJsSPWheIemhEs3ZquGJurOy7u+2xZxMdZvVDwcC0+0BbS2
         9tWMA0iebJ8hkhpP0Gd21eyt3QU5bDfDuRlvjdXGmyINuF6++rk3DzMmp4ib7Q4KER
         9tkvchaAGWRLc9y9XIg5N1PuEPGD56wlZrT9MdGw=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0AR8hVom099118
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Fri, 27 Nov 2020 02:43:31 -0600
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Fri, 27
 Nov 2020 02:43:30 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Fri, 27 Nov 2020 02:43:30 -0600
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0AR8hSXW053143;
        Fri, 27 Nov 2020 02:43:29 -0600
Subject: Re: [REGRESSION] omapdrm/N900 display broken
To:     Daniel Vetter <daniel@ffwll.ch>
CC:     Aaro Koskinen <aaro.koskinen@iki.fi>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        ML dri-devel <dri-devel@lists.freedesktop.org>,
        Tony Lindgren <tony@atomide.com>,
        linux-omap <linux-omap@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
References: <20200728181412.GA49617@darkstar.musicnaut.iki.fi>
 <660b2fe1-343d-b83e-11d2-5a5eb530b83f@ti.com>
 <448c1441-2cac-44ef-95ef-bb28b512297b@ti.com>
 <20200823162625.GC4313@darkstar.musicnaut.iki.fi>
 <ac42f7f9-2ac2-246e-69c1-3d56cea7e59b@ti.com>
 <CAKMK7uEAaNhr__aYxWpNmUb1jTruf0FMoPwgn8_so9mGV=yAOQ@mail.gmail.com>
From:   Tomi Valkeinen <tomi.valkeinen@ti.com>
Message-ID: <6f7e2f5c-3e88-25c1-d46a-8c52c15527ce@ti.com>
Date:   Fri, 27 Nov 2020 10:43:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAKMK7uEAaNhr__aYxWpNmUb1jTruf0FMoPwgn8_so9mGV=yAOQ@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 25/11/2020 11:07, Daniel Vetter wrote:

>> Laurent, does this ring any bells? The WARN comes in drm_atomic_bridge_chain_enable() when
>> drm_atomic_get_old_bridge_state() returns null for (presumably) sdi bridge.
>>
>> I'm not sure why the bridge state would not be there.
> 
> Lack of state on first modeset usually means your
> drm_mode_config_reset didn't create one. Or whatever it is you're
> using. I didn't look whether you're wiring this up correctly or not.
> We might even want to add a ->reset function to
> drm_private_state_funcs to make this work for everyone.

The bridge driver set atomic_enable and atomic_disable, but no other atomic funcs. It was supposed
to set the legacy enable & disable.

 Tomi

-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
