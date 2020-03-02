Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 976EF17584C
	for <lists+linux-omap@lfdr.de>; Mon,  2 Mar 2020 11:28:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726874AbgCBK2a (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 2 Mar 2020 05:28:30 -0500
Received: from lelv0142.ext.ti.com ([198.47.23.249]:33368 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726674AbgCBK2a (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 2 Mar 2020 05:28:30 -0500
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 022ASDTE034215;
        Mon, 2 Mar 2020 04:28:13 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1583144893;
        bh=VFRes0B1ofup81Cw5XQMgE+LuL4nvbH4EAU0rV/EHjI=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=Q2nUTJdGxCzYjFxb0BztPB8QKChlwHOaibAQ4VcRNI70XrxDXYN/RS22b3ZIdg/h3
         Vr364J0KRVb7onpFkoA686X6h/GD3cnByoftlkS+dSD03mpW+NrBzgkcUSdvj18x7V
         X4FXEovTJ9i5mJGWC37Q+MVlVsgijNGBZfzLGMc4=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 022ASD76091500
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 2 Mar 2020 04:28:13 -0600
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Mon, 2 Mar
 2020 04:28:13 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Mon, 2 Mar 2020 04:28:13 -0600
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 022AS8TE113432;
        Mon, 2 Mar 2020 04:28:09 -0600
Subject: Re: [PATCH 1/3] drm/omap: Prepare DSS for probing without legacy
 platform data
To:     Tony Lindgren <tony@atomide.com>
CC:     <linux-omap@vger.kernel.org>, "Andrew F . Davis" <afd@ti.com>,
        Dave Gerlach <d-gerlach@ti.com>,
        Faiz Abbas <faiz_abbas@ti.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Keerthy <j-keerthy@ti.com>, Nishanth Menon <nm@ti.com>,
        Peter Ujfalusi <peter.ujfalusi@ti.com>,
        Roger Quadros <rogerq@ti.com>, Suman Anna <s-anna@ti.com>,
        Tero Kristo <t-kristo@ti.com>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <dri-devel@lists.freedesktop.org>, Jyri Sarha <jsarha@ti.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sebastian Reichel <sre@kernel.org>
References: <20200224191230.30972-1-tony@atomide.com>
 <20200224191230.30972-2-tony@atomide.com>
 <20200224233111.gkctx27usfxj2wgz@earth.universe>
 <20200224234333.GD37466@atomide.com> <20200227174424.GI37466@atomide.com>
From:   Tomi Valkeinen <tomi.valkeinen@ti.com>
Message-ID: <8b27dba3-2e2b-84ce-0927-685f4bfe3ab2@ti.com>
Date:   Mon, 2 Mar 2020 12:28:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200227174424.GI37466@atomide.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 27/02/2020 19:44, Tony Lindgren wrote:

>>> FWIW, I dropped omapdss-boot-init.c in my patch series updating DSI
>>> code to use common panel infrastructure, so this will conflict.
>>
>> Hey that's great :) Sounds like we can set up an immutable branch
>> for just this $subject patch against v5.6-rc1 to resolve the
>> conflict. I can set it up for Tomi or Tomi can set it up for me,
>> whichever Tomi prefers.
> 
> Do you want me to send you a pull request for just this one patch
> against v5.6-rc1?

It's probably easier if Sebastian drops the removal patch, and instead creates a patch that removes 
the panel-dsi-cm from omapdss_of_fixups_whitelist. That change should not conflict, and effectively 
makes the omapdss-boot-init.c a no-op.

We can then remove the file later.

  Tomi

-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
