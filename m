Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ED59D2175C4
	for <lists+linux-omap@lfdr.de>; Tue,  7 Jul 2020 20:01:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728225AbgGGSBS (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 7 Jul 2020 14:01:18 -0400
Received: from muru.com ([72.249.23.125]:32788 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727777AbgGGSBS (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 7 Jul 2020 14:01:18 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 4DD3A80FB;
        Tue,  7 Jul 2020 18:02:11 +0000 (UTC)
Date:   Tue, 7 Jul 2020 11:01:15 -0700
From:   Tony Lindgren <tony@atomide.com>
To:     "H. Nikolaus Schaller" <hns@goldelico.com>
Cc:     Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Discussions about the Letux Kernel 
        <letux-kernel@openphoenux.org>, kernel@pyra-handheld.com,
        Linux-OMAP <linux-omap@vger.kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Jyri Sarha <jsarha@ti.com>
Subject: Re: OMAP5: inconsistency between target-module and dsi_of_data_omap5
Message-ID: <20200707180115.GB5849@atomide.com>
References: <F5C04FAF-0029-48F3-B0A6-5327CD911EA2@goldelico.com>
 <49725F81-E615-4101-81B3-0850F201D9E8@goldelico.com>
 <5F4C23B0-A82B-4F94-BD74-D04F6D798FC0@goldelico.com>
 <20200705142653.GQ37466@atomide.com>
 <20200705143614.GR37466@atomide.com>
 <E200E98D-A4F8-4270-B192-33733F4C7235@goldelico.com>
 <20200706143613.GS37466@atomide.com>
 <E4616E3C-2519-4421-BC75-87A5CA2BB9EF@goldelico.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <E4616E3C-2519-4421-BC75-87A5CA2BB9EF@goldelico.com>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* H. Nikolaus Schaller <hns@goldelico.com> [200706 16:11]:
> > Am 06.07.2020 um 16:36 schrieb Tony Lindgren <tony@atomide.com>:
> > I think you should now be using just the generic panel with
> > drivers/gpu/drm/panel/panel-simple or some panel specific
> > driver for dsi.
> 
> None of them supports the vendor specific MIPI commands of
> this panel.
> 
> Therefore we have our own panel driver for years and try to
> keep pace with upstream changes.

OK yeah would be good to have it upstream. It might see use
on some other platforms while waiting for the pyra dts files.

Regards,

Tony
