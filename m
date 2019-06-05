Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B135335885
	for <lists+linux-omap@lfdr.de>; Wed,  5 Jun 2019 10:29:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726633AbfFEI3r (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 5 Jun 2019 04:29:47 -0400
Received: from asavdk4.altibox.net ([109.247.116.15]:56722 "EHLO
        asavdk4.altibox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726554AbfFEI3q (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 5 Jun 2019 04:29:46 -0400
Received: from ravnborg.org (unknown [158.248.194.18])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by asavdk4.altibox.net (Postfix) with ESMTPS id A76C880407;
        Wed,  5 Jun 2019 10:29:43 +0200 (CEST)
Date:   Wed, 5 Jun 2019 10:29:42 +0200
From:   Sam Ravnborg <sam@ravnborg.org>
To:     "H. Nikolaus Schaller" <hns@goldelico.com>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, tomi.valkeinen@ti.com,
        imirkin@alum.mit.edu, marek.belisko@gmail.com,
        letux-kernel@openphoenux.org, linux-omap@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v2 0/2] drm/panel-simple: Add panel parameters for
 ortustech-com37h3m05dtc/99dtc and sharp-lq070y3dg3b
Message-ID: <20190605082942.GC15169@ravnborg.org>
References: <cover.1559711222.git.hns@goldelico.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1559711222.git.hns@goldelico.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=VcLZwmh9 c=1 sm=1 tr=0
        a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
        a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=VwQbUJbxAAAA:8
        a=DwvPuToIzeF-Hk4mpeMA:9 a=CjuIK1q_8ugA:10 a=AjGcO6oz07-iQ99wixmX:22
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi Nikolaus.

Thanks for the new panel patches.
On Wed, Jun 05, 2019 at 07:07:01AM +0200, H. Nikolaus Schaller wrote:
> V2:
> * fix typo in 99dtc panel compatible string (reported by imirkin@alum.mit.edu)
> 
> V1:
> 
> Since v5.2-rc1 OMAP is no longer using a special display driver architecture
> for DPI panels, but uses the general drm/panel/panel-simple.
> 
> So we finally can add SoC independent panel definitions for two panel models
> which we already had worked on quite a while ago (before device tree was
> introduced):
> 
> 	https://patchwork.kernel.org/patch/2851295/
> 
> 
> 
> H. Nikolaus Schaller (2):
>   drm/panel: simple: Add Sharp LQ070Y3DG3B panel support
>   drm/panel: simple: Add Ortustech COM37H3M panel support

All three panels are missing binding documentation.
Please submit binding documentation, in separate patches, with
proper "dt-bindings: xxx" subjects.
See Documentation/device-tree/bindings/submitting...

Patches not applied due to the missing docs.
But the patches itself looked good.
You have specified bus_flags etc, and added the
new entries in correct alphabetical order etc.

	Sam
