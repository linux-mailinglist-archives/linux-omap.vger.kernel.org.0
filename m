Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3905E16EF6F
	for <lists+linux-omap@lfdr.de>; Tue, 25 Feb 2020 20:53:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729510AbgBYTxC (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 25 Feb 2020 14:53:02 -0500
Received: from muru.com ([72.249.23.125]:57514 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728443AbgBYTxC (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 25 Feb 2020 14:53:02 -0500
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id A376F810E;
        Tue, 25 Feb 2020 19:53:46 +0000 (UTC)
Date:   Tue, 25 Feb 2020 11:52:58 -0800
From:   Tony Lindgren <tony@atomide.com>
To:     Tomi Valkeinen <tomi.valkeinen@ti.com>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sebastian Reichel <sre@kernel.org>,
        dri-devel@lists.freedesktop.org, linux-omap@vger.kernel.org,
        Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>,
        Merlijn Wajer <merlijn@wizzup.org>, ruleh <ruleh@gmx.de>
Subject: Re: [PATCH] drm/omap: Fix drm_handle_vblank() handling for command
 mode panels
Message-ID: <20200225195258.GI37466@atomide.com>
References: <20200225183733.50875-1-tony@atomide.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200225183733.50875-1-tony@atomide.com>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Tony Lindgren <tony@atomide.com> [200225 18:38]:
> Only lightly tested so far, please test. Also, I'm not sure if we
> should get the id from somewhere for drm_handle_vblank() instead of
> just using 0?

Also looks like we can now get WARN_ON(omap_crtc->pending)
in omap_crtc_arm_event(), so obviously some changes are
needed.

Regards,

Tony
