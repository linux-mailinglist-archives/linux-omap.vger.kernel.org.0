Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B1DA316B5FE
	for <lists+linux-omap@lfdr.de>; Tue, 25 Feb 2020 00:48:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728206AbgBXXsD (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 24 Feb 2020 18:48:03 -0500
Received: from muru.com ([72.249.23.125]:57382 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726651AbgBXXsD (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Mon, 24 Feb 2020 18:48:03 -0500
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id AFCFE8030;
        Mon, 24 Feb 2020 23:48:47 +0000 (UTC)
Date:   Mon, 24 Feb 2020 15:47:59 -0800
From:   Tony Lindgren <tony@atomide.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Sebastian Reichel <sebastian.reichel@collabora.com>,
        Sebastian Reichel <sre@kernel.org>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Merlijn Wajer <merlijn@wizzup.org>,
        "H. Nikolaus Schaller" <hns@goldelico.com>,
        Rob Herring <robh@kernel.org>, linux-omap@vger.kernel.org,
        dri-devel@lists.freedesktop.org, kernel@collabora.com
Subject: Re: [PATCHv2 02/56] ARM: dts: omap4-droid4: add panel compatible
Message-ID: <20200224234759.GE37466@atomide.com>
References: <20200224232126.3385250-1-sebastian.reichel@collabora.com>
 <20200224232126.3385250-3-sebastian.reichel@collabora.com>
 <20200224233708.GG16163@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200224233708.GG16163@pendragon.ideasonboard.com>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Laurent Pinchart <laurent.pinchart@ideasonboard.com> [200224 23:38]:
> Hi Sebastian,
> 
> Thank you for the patch.
> 
> On Tue, Feb 25, 2020 at 12:20:32AM +0100, Sebastian Reichel wrote:
> > Add Droid 4 specific compatible value in addition to the
> > generic one, so that we have the ability to add panel
> > specific quirks in the future.
> 
> We need to document this compatible string in DT bindings, I don't think
> this is included in this series. Furthermore, could we use a compatible
> string that actually matches the panel vendor and model, instead of the
> device name ?

To me it seems there are multiple similar panels from various
vendors in use for xt875/xt894/xt910/xt912 phones, I'm not sure
if anybody has this list?

Regards,

Tony
