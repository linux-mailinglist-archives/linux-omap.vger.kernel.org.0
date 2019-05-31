Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D85DD30E09
	for <lists+linux-omap@lfdr.de>; Fri, 31 May 2019 14:23:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726442AbfEaMX7 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 31 May 2019 08:23:59 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:36056 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726403AbfEaMX7 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 31 May 2019 08:23:59 -0400
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x4VCNZIo115859;
        Fri, 31 May 2019 07:23:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1559305415;
        bh=s5BHi330exWmUynpqb3iUBypm5V6BAHHNT54lxakjVA=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=aQKXDnGdpv2gEhPpPuFA0HXuKGGuRolwmTMAlhjUjJKl71A2mXvmPJOWIl1PSpTpS
         0b0Xeka1tz5O/qnoglvbWwln2l4EEzQe8W+vnbe4WWTAoe1WKWHWsR5U4Cna/fMajp
         LhLdga4wdStzbDyMxcEgka0AmK59q9CuxvcwZJUA=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x4VCNZpr039855
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Fri, 31 May 2019 07:23:35 -0500
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Fri, 31
 May 2019 07:23:34 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Fri, 31 May 2019 07:23:34 -0500
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x4VCNWQC031859;
        Fri, 31 May 2019 07:23:33 -0500
Subject: Re: [PATCHv6 3/4] drm/omap: add framedone interrupt support
To:     Sebastian Reichel <sre@kernel.org>
CC:     Tony Lindgren <tony@atomide.com>, Pavel Machek <pavel@ucw.cz>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        "H. Nikolaus Schaller" <hns@goldelico.com>,
        <dri-devel@lists.freedesktop.org>, <linux-omap@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <kernel@collabora.com>
References: <20190523200756.25314-1-sebastian.reichel@collabora.com>
 <20190523200756.25314-4-sebastian.reichel@collabora.com>
 <9eb23a5d-438e-7b25-e7cb-8b734a150e43@ti.com>
 <20190529215530.mi3fjlsaziq22mw5@earth.universe>
From:   Tomi Valkeinen <tomi.valkeinen@ti.com>
Message-ID: <bbe14265-4499-4a55-ef94-9def2df365d7@ti.com>
Date:   Fri, 31 May 2019 15:23:32 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190529215530.mi3fjlsaziq22mw5@earth.universe>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 30/05/2019 00:55, Sebastian Reichel wrote:

> Oh sorry, I missed the part that omap_irq_wait_init() actually
> enables the framedone irq. It should be enough to just drop the
> warning (and the curly brackets) to keep existing behaviour. The
> code exits early with the above warning for any existing code (since
> that does not register a framedone handler). DSI on the other hand
> does not reach the omap_irq_wait_init() part. Regarding combining
> the logic: I don't think there is anything to combine right now.
> It should be possible to simplify the logic after DSI has been
> converted to drm_panel style, since this will move the update logic
> for the screen content from the panel driver to DSI core.
> 
> TLDR: It's enough to remove the warning. Do you need a new
> submission for this?

Ok. No, I can edit the patch.

Nikolaus, are you able to test DSI videomode with these patches?

  Tomi

-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
