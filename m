Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6C17620EDDA
	for <lists+linux-omap@lfdr.de>; Tue, 30 Jun 2020 07:51:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726892AbgF3FvT (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 30 Jun 2020 01:51:19 -0400
Received: from asavdk3.altibox.net ([109.247.116.14]:47626 "EHLO
        asavdk3.altibox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726404AbgF3FvT (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 30 Jun 2020 01:51:19 -0400
Received: from ravnborg.org (unknown [188.228.123.71])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by asavdk3.altibox.net (Postfix) with ESMTPS id 5D39120021;
        Tue, 30 Jun 2020 07:51:17 +0200 (CEST)
Date:   Tue, 30 Jun 2020 07:51:16 +0200
From:   Sam Ravnborg <sam@ravnborg.org>
To:     Sebastian Reichel <sebastian.reichel@collabora.com>
Cc:     Sebastian Reichel <sre@kernel.org>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Tony Lindgren <tony@atomide.com>, Pavel Machek <pavel@ucw.cz>,
        Merlijn Wajer <merlijn@wizzup.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        "H. Nikolaus Schaller" <hns@goldelico.com>,
        Rob Herring <robh+dt@kernel.org>,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-omap@vger.kernel.org, kernel@collabora.com
Subject: Re: [PATCHv1 0/4] panel-dsi-cm: update bindings
Message-ID: <20200630055116.GB361800@ravnborg.org>
References: <20200629223315.118256-1-sebastian.reichel@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200629223315.118256-1-sebastian.reichel@collabora.com>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=f+hm+t6M c=1 sm=1 tr=0
        a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
        a=kj9zAlcOel0A:10 a=PtV5s_OSQqKhbhFn9OoA:9 a=CjuIK1q_8ugA:10
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi Sebastian.

On Tue, Jun 30, 2020 at 12:33:11AM +0200, Sebastian Reichel wrote:
> Subject: panel-dsi-cm: update bindings
> 
> The cleanup series for omapdrm's DSI code got too big. Reviewing
> this is not fun and the same goes for keeping track of the change
> requests. Let's do the cleanup in smaller steps instead.
Appreciated!

	Sam
