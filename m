Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0D54219291C
	for <lists+linux-omap@lfdr.de>; Wed, 25 Mar 2020 14:04:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727374AbgCYNED (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 25 Mar 2020 09:04:03 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:42504 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726998AbgCYNED (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 25 Mar 2020 09:04:03 -0400
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6028780C;
        Wed, 25 Mar 2020 14:04:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1585141441;
        bh=6ESgYXQNbR9jlwgiu8tVT7qF3Sn2LzNkZefQNRK0qTY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=PsavOhL5DIODE04YpvKRs5TIWf4Cpkmi8RG6XxmQeHjpXA+uWDVz1G3OEf27sQ54H
         kjDbC3Dw8GuAUZVpYIkGrJEfjGDds7W3YkGdY5E9edqrBVuu25k7drcvVjiNAyW7ZQ
         luboE+LUX3UyTcwgVTRVfk2wbFVuT+8neAz9k+eM=
Date:   Wed, 25 Mar 2020 15:03:58 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Tomi Valkeinen <tomi.valkeinen@ti.com>
Cc:     Sebastian Reichel <sebastian.reichel@collabora.com>,
        Sebastian Reichel <sre@kernel.org>,
        Tony Lindgren <tony@atomide.com>,
        Merlijn Wajer <merlijn@wizzup.org>,
        "H. Nikolaus Schaller" <hns@goldelico.com>,
        Rob Herring <robh@kernel.org>, linux-omap@vger.kernel.org,
        dri-devel@lists.freedesktop.org, kernel@collabora.com
Subject: Re: [PATCHv2 00/56] drm/omap: Convert DSI code to use drm_mipi_dsi
 and drm_panel
Message-ID: <20200325130358.GE19171@pendragon.ideasonboard.com>
References: <20200224232126.3385250-1-sebastian.reichel@collabora.com>
 <32b73b0a-a5f6-e311-b2d5-95e333f039a4@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <32b73b0a-a5f6-e311-b2d5-95e333f039a4@ti.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi Tomi,

On Wed, Mar 25, 2020 at 02:47:48PM +0200, Tomi Valkeinen wrote:
> On 25/02/2020 01:20, Sebastian Reichel wrote:
> > This updates the existing omapdrm DSI code, so that it uses
> > common drm_mipi_dsi API and drm_panel.
> > 
> > The patchset has been tested with Droid 4 using Linux console, X.org and
> > Weston. The patchset is based on Laurent Pinchartl's patch series [0]
> > and removes the last custom panel driver, so quite a few cleanups on the
> > omapdrm codebase were possible.
> 
> This is a big series, and I suggest to keep the cleanups to minimum.
> Things can be cleaned up afterwards after the functional parts of this
> series have been merged.

There are a few cleanups at the bottom of the series that could be
merged without waiting for the rest though :-)

-- 
Regards,

Laurent Pinchart
