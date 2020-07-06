Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1B8F12159B6
	for <lists+linux-omap@lfdr.de>; Mon,  6 Jul 2020 16:36:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729288AbgGFOgR (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 6 Jul 2020 10:36:17 -0400
Received: from muru.com ([72.249.23.125]:60880 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729259AbgGFOgR (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Mon, 6 Jul 2020 10:36:17 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 02F4480FE;
        Mon,  6 Jul 2020 14:37:08 +0000 (UTC)
Date:   Mon, 6 Jul 2020 07:36:13 -0700
From:   Tony Lindgren <tony@atomide.com>
To:     "H. Nikolaus Schaller" <hns@goldelico.com>
Cc:     Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Discussions about the Letux Kernel 
        <letux-kernel@openphoenux.org>, kernel@pyra-handheld.com,
        Linux-OMAP <linux-omap@vger.kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Jyri Sarha <jsarha@ti.com>
Subject: Re: OMAP5: inconsistency between target-module and dsi_of_data_omap5
Message-ID: <20200706143613.GS37466@atomide.com>
References: <F5C04FAF-0029-48F3-B0A6-5327CD911EA2@goldelico.com>
 <49725F81-E615-4101-81B3-0850F201D9E8@goldelico.com>
 <5F4C23B0-A82B-4F94-BD74-D04F6D798FC0@goldelico.com>
 <20200705142653.GQ37466@atomide.com>
 <20200705143614.GR37466@atomide.com>
 <E200E98D-A4F8-4270-B192-33733F4C7235@goldelico.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <E200E98D-A4F8-4270-B192-33733F4C7235@goldelico.com>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* H. Nikolaus Schaller <hns@goldelico.com> [200705 15:41]:
> Does the panel driver also need some modification? It is no longer loaded.

Hmm so what's the panel driver in this case?

I think you should now be using just the generic panel with
drivers/gpu/drm/panel/panel-simple or some panel specific
driver for dsi.

I think dsi command mode is now the only omapdrm output not
yet using generic panel. And Sebastian has a branch pending
for updating dsi command mode to use generic panel.

Regards,

Tony



