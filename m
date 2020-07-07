Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4D180217778
	for <lists+linux-omap@lfdr.de>; Tue,  7 Jul 2020 21:04:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728305AbgGGTEZ (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 7 Jul 2020 15:04:25 -0400
Received: from mo4-p00-ob.smtp.rzone.de ([85.215.255.25]:22399 "EHLO
        mo4-p00-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728272AbgGGTEZ (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 7 Jul 2020 15:04:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1594148659;
        s=strato-dkim-0002; d=goldelico.com;
        h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=Gbz7SP3eJ7xcCT8MwiYv8FfyWlDQZHKQNKnj48shZ0E=;
        b=C4Pu8Nq21MjkRLqq2utktgfhV9oqpt6MjudL9JW70zWQEhJwwPlr0PHeBiuoGSC98M
        x9ZM1dZ1P0KYgP6jN2ztorzMVXjg3cxMjcBgMH6I0iMb5Kw8IpXx1tO7299FlQgMzrkW
        a/TnS0K1R0AKOYRXLtNrr6WBr+hyoLWTdm1CQivBxE2I0wmP09JpR4qUo2FlSXRIyi+1
        6uuOqxWF8nL2VzFmv/fBgy3B47pchxEme3CmXHFK/0i58r1gZW3mPOPN4Gg0N+cF7V21
        SIbh1sCl3MgUNmSMX8PYkHlqZZ6ZcUoFYXfZDRjsiJ8z2ZvJvA92IU8YEVfBnNUGlx9I
        2sNQ==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBj7wpz8NMGH/PrwDOjV78="
X-RZG-CLASS-ID: mo00
Received: from mbp-13-nikolaus.fritz.box
        by smtp.strato.de (RZmta 46.10.5 DYNA|AUTH)
        with ESMTPSA id V07054w67J4Bw7a
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
        (Client did not present a certificate);
        Tue, 7 Jul 2020 21:04:11 +0200 (CEST)
Subject: Re: OMAP5: inconsistency between target-module and dsi_of_data_omap5
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Content-Type: text/plain; charset=us-ascii
From:   "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <20200707180115.GB5849@atomide.com>
Date:   Tue, 7 Jul 2020 21:04:09 +0200
Cc:     Discussions about the Letux Kernel <letux-kernel@openphoenux.org>,
        kernel@pyra-handheld.com, Linux-OMAP <linux-omap@vger.kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Jyri Sarha <jsarha@ti.com>
Content-Transfer-Encoding: 7bit
Message-Id: <ECE29C41-DFE5-4A50-9206-6FB3183824C3@goldelico.com>
References: <F5C04FAF-0029-48F3-B0A6-5327CD911EA2@goldelico.com> <49725F81-E615-4101-81B3-0850F201D9E8@goldelico.com> <5F4C23B0-A82B-4F94-BD74-D04F6D798FC0@goldelico.com> <20200705142653.GQ37466@atomide.com> <20200705143614.GR37466@atomide.com> <E200E98D-A4F8-4270-B192-33733F4C7235@goldelico.com> <20200706143613.GS37466@atomide.com> <E4616E3C-2519-4421-BC75-87A5CA2BB9EF@goldelico.com> <20200707180115.GB5849@atomide.com>
To:     Tony Lindgren <tony@atomide.com>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>
X-Mailer: Apple Mail (2.3124)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi Tony and Tomi,

> Am 07.07.2020 um 20:01 schrieb Tony Lindgren <tony@atomide.com>:
> 
> * H. Nikolaus Schaller <hns@goldelico.com> [200706 16:11]:
>>> Am 06.07.2020 um 16:36 schrieb Tony Lindgren <tony@atomide.com>:
>>> I think you should now be using just the generic panel with
>>> drivers/gpu/drm/panel/panel-simple or some panel specific
>>> driver for dsi.
>> 
>> None of them supports the vendor specific MIPI commands of
>> this panel.
>> 
>> Therefore we have our own panel driver for years and try to
>> keep pace with upstream changes.
> 
> OK yeah would be good to have it upstream. It might see use
> on some other platforms while waiting for the pyra dts files.

So if you think we can get the panel driver upstream without the
pyra dts files I am happy to submit something for review.

But I have to fix it first.

Maybe Tomi can comment about ideas what structural changes have
been done so that it got broken since v5.7-rc1. Then it becomes
easier to fix for me. Maybe there was some rework in omapdrm/dss
which needs some change in the driver.

And what I would need to know before I start to write new code is
if is possible to operate a video mipi dsi panel with driver from
gpu/drm/panel together with omapdrm (v5.7 and later).

If this is possible it should be quite easy to mix the
old omapdrm/display driver code with e.g.:

drivers/gpu/drm/panel/panel-orisetech-otm8009a.c

BR and thanks,
Nikolaus

