Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 66E6155946
	for <lists+linux-omap@lfdr.de>; Tue, 25 Jun 2019 22:44:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726706AbfFYUoC (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 25 Jun 2019 16:44:02 -0400
Received: from asavdk3.altibox.net ([109.247.116.14]:60477 "EHLO
        asavdk3.altibox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726053AbfFYUoC (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 25 Jun 2019 16:44:02 -0400
Received: from ravnborg.org (unknown [158.248.194.18])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by asavdk3.altibox.net (Postfix) with ESMTPS id 4ADB720030;
        Tue, 25 Jun 2019 22:43:58 +0200 (CEST)
Date:   Tue, 25 Jun 2019 22:43:56 +0200
From:   Sam Ravnborg <sam@ravnborg.org>
To:     "H. Nikolaus Schaller" <hns@goldelico.com>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, tomi.valkeinen@ti.com,
        imirkin@alum.mit.edu, marek.belisko@gmail.com,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        devicetree@vger.kernel.org, letux-kernel@openphoenux.org,
        linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v3 0/5] drm/panel-simple: Add panel parameters for
 ortustech-com37h3m05dtc/99dtc and sharp-lq070y3dg3b
Message-ID: <20190625204356.GF18595@ravnborg.org>
References: <cover.1559905870.git.hns@goldelico.com>
 <0842FF88-D8E0-441B-837B-769C2EF6C1CB@goldelico.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0842FF88-D8E0-441B-837B-769C2EF6C1CB@goldelico.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=dqr19Wo4 c=1 sm=1 tr=0
        a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
        a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=7gkXJVJtAAAA:8
        a=VwQbUJbxAAAA:8 a=F2Ilv35yRVFRMjSxL0sA:9 a=CjuIK1q_8ugA:10
        a=E9Po1WZjFZOl8hwRPBS3:22 a=AjGcO6oz07-iQ99wixmX:22
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi Nikolaus

> > V3:
> > * add bindings documentation (suggested by sam@ravnborg.org)
> > 
> > V2 2019-06-05 07:07:05:
> > * fix typo in 99dtc panel compatible string (reported by imirkin@alum.mit.edu)
> > 
> > V1 2019-06-04 14:53:00:
> > 
> > Since v5.2-rc1 OMAP is no longer using a special display driver architecture
> > for DPI panels, but uses the general drm/panel/panel-simple.
> > 
> > So we finally can add SoC independent panel definitions for two panel models
> > which we already had worked on quite a while ago (before device tree was
> > introduced):
> > 
> > 	https://patchwork.kernel.org/patch/2851295/
> > 
> > 
> > 
> > H. Nikolaus Schaller (5):
> >  drm/panel: simple: Add Sharp LQ070Y3DG3B panel support
> >  drm/panel: simple: Add Ortustech COM37H3M panel support
> >  dt-bindings: drm/panel: simple: add ortustech,com37h3m05dtc panel
> >  dt-bindings: drm/panel: simple: add ortustech,com37h3m99dtc panel
> >  dt-bindings: drm/panel: simple: add sharp,lq070y3dg3b panel
> > 
> > .../display/panel/ortustech,com37h3m05dtc.txt | 12 ++++
> > .../display/panel/ortustech,com37h3m99dtc.txt | 12 ++++
> > .../display/panel/sharp,lq070y3dg3b.txt       | 12 ++++
> > drivers/gpu/drm/panel/panel-simple.c          | 63 +++++++++++++++++++
> > 4 files changed, 99 insertions(+)
> > create mode 100644 Documentation/devicetree/bindings/display/panel/ortustech,com37h3m05dtc.txt
> > create mode 100644 Documentation/devicetree/bindings/display/panel/ortustech,com37h3m99dtc.txt
> > create mode 100644 Documentation/devicetree/bindings/display/panel/sharp,lq070y3dg3b.txt
> > 
> > -- 
> > 2.19.1
> > 
> 
> any progress towards merging this somewhere? It did not yet arrive in linux-next.
> 
> BTW: should also be applied to 5.2
The drm bits are reviewed. The DT bits needs OK from DT people.
When we have OK from DT people we can apply them all to drm-misc-next.

If we need them expedited towards the upstream kernel you will need help
from someone else. But let's get them in drm-misc-next first.

	Sam
