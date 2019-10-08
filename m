Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7A47CCF220
	for <lists+linux-omap@lfdr.de>; Tue,  8 Oct 2019 07:28:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729489AbfJHFZM (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 8 Oct 2019 01:25:12 -0400
Received: from lelv0143.ext.ti.com ([198.47.23.248]:46250 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729440AbfJHFZM (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 8 Oct 2019 01:25:12 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x985OoEi012153;
        Tue, 8 Oct 2019 00:24:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1570512290;
        bh=AEmf1HcgRzxwk9rzdGvl+kF7AbL/MwAImYXwpTaFMQM=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=OlkLRrLdFkJP9Wx/IqPxHVjrW3wRzt4dTByNcLKfBx++4Q1RRwambw57HKfVVPygx
         RI2Ee+BhJm8XN+YPW+dOmpnP3OyGbf4X8ukkuWob2DU/H0VjnoaptSEfHrrwAObhDT
         7fNC4e65tFZSg2UvL/TjCCU+xt/f201mPs/fDw+0=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x985OowU008055
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 8 Oct 2019 00:24:50 -0500
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Tue, 8 Oct
 2019 00:24:46 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Tue, 8 Oct 2019 00:24:48 -0500
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x985OkZi122677;
        Tue, 8 Oct 2019 00:24:47 -0500
Subject: Re: [PATCH 0/5] Fix SPI module alias for panels used by omapdrm
To:     Sam Ravnborg <sam@ravnborg.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
CC:     <dri-devel@lists.freedesktop.org>,
        "H. Nikolaus Schaller" <hns@goldelico.com>,
        <thierry.reding@gmail.com>, <letux-kernel@openphoenux.org>,
        Tony Lindgren <tony@atomide.com>, Jyri Sarha <jsarha@ti.com>,
        <linux-omap@vger.kernel.org>
References: <20191007170801.27647-1-laurent.pinchart@ideasonboard.com>
 <20191007172256.GA1956@ravnborg.org>
From:   Tomi Valkeinen <tomi.valkeinen@ti.com>
Message-ID: <c5bac722-89ac-7d17-2a8c-7297ecb4f836@ti.com>
Date:   Tue, 8 Oct 2019 08:24:38 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20191007172256.GA1956@ravnborg.org>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 07/10/2019 20:22, Sam Ravnborg wrote:
> Hi Laurent.
> On Mon, Oct 07, 2019 at 08:07:56PM +0300, Laurent Pinchart wrote:
>> Hello,
>>
>> This patch series fixes a module alias issue with the five recently
>> added panel drivers used by omapdrm.
>>
>> Before those panel drivers, omapdrm had custom drivers for the panels,
>> and prefixed the OF compatible strings with an "omapdss," prefix. The
>> SPI device IDs are constructed by stripping the OF compatible string
>> from the prefix, resulting in the "omapdss," prefix being removed, but
>> the subsequence OF vendor prefix being kept. The SPI drivers thus had
>> modules aliases that contained the vendor prefix.
>>
>> Now that the panels are supported by standard drivers and the "omapdss,"
>> prefix is removed, the SPI device IDs are stripped from the OF vendor
>> prefix. As the new panel drivers copied the module aliases from the
>> omapdrm-specific drivers, they contain the vendor prefix in their SPI
>> module aliases, and are thus not loaded automatically.
>>
>> Fix this by removing the vendor prefix from the SPI modules aliases in
>> the drivers. For consistency reason, the manual module aliases are also
>> moved to use an SPI module table.
> 
> Good explanation - thanks.
> 
>>
>> These patches are based on the drm-misc-fixes branch as they fix v5.4
>> regressions.
>>
>> Laurent Pinchart (5):
>>    drm/panel: lg-lb035q02: Fix SPI alias
>>    drm/panel: nec-nl8048hl11: Fix SPI alias
>>    drm/panel: sony-acx565akm: Fix SPI alias
>>    drm/panel: tpo-td028ttec1: Fix SPI alias
>>    drm/panel: tpo-td043mtea1: Fix SPI alias
> 
> Full series is:
> Acked-by: Sam Ravnborg <sam@ravnborg.org>
> 
> I expect someone else to pick them up or that you apply them.

Thanks! I've pushed these to drm-misc-fixes.

  Tomi

-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
