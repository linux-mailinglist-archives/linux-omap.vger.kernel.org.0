Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3D729249527
	for <lists+linux-omap@lfdr.de>; Wed, 19 Aug 2020 08:46:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726861AbgHSGqc convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-omap@lfdr.de>); Wed, 19 Aug 2020 02:46:32 -0400
Received: from muru.com ([72.249.23.125]:40904 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726959AbgHSGqb (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Wed, 19 Aug 2020 02:46:31 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 3AE6E807A;
        Wed, 19 Aug 2020 06:46:29 +0000 (UTC)
Date:   Wed, 19 Aug 2020 09:46:57 +0300
From:   Tony Lindgren <tony@atomide.com>
To:     Sebastian Reichel <sre@kernel.org>
Cc:     Sam Ravnborg <sam@ravnborg.org>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Pavel Machek <pavel@ucw.cz>,
        Merlijn Wajer <merlijn@wizzup.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        "H. Nikolaus Schaller" <hns@goldelico.com>,
        Rob Herring <robh+dt@kernel.org>,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-omap@vger.kernel.org, kernel@collabora.com,
        Rob Herring <robh@kernel.org>
Subject: Re: [PATCHv2 1/4] dt-bindings: display: panel-dsi-cm: convert to YAML
Message-ID: <20200819064657.GW2994@atomide.com>
References: <20200716125733.83654-1-sebastian.reichel@collabora.com>
 <20200716125733.83654-2-sebastian.reichel@collabora.com>
 <20200716175258.GE2235355@ravnborg.org>
 <20200716180710.u6pqe6fvn4usuidf@earth.universe>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: 8BIT
In-Reply-To: <20200716180710.u6pqe6fvn4usuidf@earth.universe>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Sebastian Reichel <sre@kernel.org> [200716 18:07]:
> On Thu, Jul 16, 2020 at 07:52:58PM +0200, Sam Ravnborg wrote:
> > The DTS file changes needs to go in via another route.
> 
> No worries. I guess Tony will queue them up when he finds some time.

Thanks applying the dts changes into omap-for-v5.10/dt.

Regards,

Tony
