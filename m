Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6D01E11E219
	for <lists+linux-omap@lfdr.de>; Fri, 13 Dec 2019 11:37:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725793AbfLMKhD (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 13 Dec 2019 05:37:03 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:48542 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725747AbfLMKhD (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 13 Dec 2019 05:37:03 -0500
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 863019F4;
        Fri, 13 Dec 2019 11:36:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1576233419;
        bh=jwy8V32la/gbk1rg9AIOa9ojDpfNGVEao4L/0jvjxYc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=KqUrGGff/NfA7HqTmXvE9Ld2qQ+GprK4M+mLKT/HJTmSCm37lu0wlfcsvJE3eD7Qq
         obrr+X92bKjXgJO/Bqressdu0zqSDhaj9eYwYymhP4Zykww4Q1v7cv2mKuiNgfc+bE
         ito566zT/eVFj67j0x5KGjko7axwc66+ff9ZxeMc=
Date:   Fri, 13 Dec 2019 12:36:50 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Jyri Sarha <jsarha@ti.com>
Cc:     dri-devel@lists.freedesktop.org, tony@atomide.com,
        sam@ravnborg.org, robh+dt@kernel.org, devicetree@vger.kernel.org,
        linux-omap@vger.kernel.org, tomi.valkeinen@ti.com,
        peter.ujfalusi@ti.com, bparrot@ti.com
Subject: Re: [PATCH v2 2/3] dt-bindings: display: Add obsolete note to
 "ti,tilcdc,panel" binding
Message-ID: <20191213103650.GA4860@pendragon.ideasonboard.com>
References: <cover.1575901747.git.jsarha@ti.com>
 <459ed943fe0725200062171755bcfe5f73713d50.1575901747.git.jsarha@ti.com>
 <20191209145024.GB12841@pendragon.ideasonboard.com>
 <5f585e0b-be58-b474-f27b-875e254426a8@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <5f585e0b-be58-b474-f27b-875e254426a8@ti.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi Jyri,

On Fri, Dec 13, 2019 at 11:04:49AM +0200, Jyri Sarha wrote:
> On 09/12/2019 16:50, Laurent Pinchart wrote:
> > On Mon, Dec 09, 2019 at 04:42:15PM +0200, Jyri Sarha wrote:
> >> The "ti,tilcdc,panel" binding should not be used anymore, since tilcdc
> >> is fully capable of using generic drm panels like panel-simple and
> >> panel-common binding. However, the obsolete binding is still widely
> >> used in many mainline supported platforms that I do not have access to
> >> and who knows how many custom platforms. So I am afraid we have to
> >> keep the old bundled tilcdc panel driver around.
> > 
> > But can't we drop the bindings instead of marking them as obsolete, even
> > if we keep the driver around for some time ?
> > 
> 
> I guess that would be alright too.
> 
> > Also, would it make sense to set a date for the removal of the driver,
> > and add it to the WARN() message in patch 3/3 ?
> > 
> 
> Not sure about a date. I would feel quite uncomfortable of removing the
> driver, while there is still mainline DTSes using "ti,tilcdc,panel". I
> guess the next step would be putting the legacy panel driver behind a
> default = N config option. Then I would probably hear something if there
> are people actively using those DTSes. Maybe the date could be about
> that too.

The mainline DTSes are not really an issue, they should be fixed in
mainline to use new bindings, and all will be good. The problem is
systems using out-of-tree DTSes, or systems that will upgrade the kernel
but not the DT.

> >> Signed-off-by: Jyri Sarha <jsarha@ti.com>
> >> ---
> >>  Documentation/devicetree/bindings/display/tilcdc/panel.txt | 6 ++++++
> >>  1 file changed, 6 insertions(+)
> >>
> >> diff --git a/Documentation/devicetree/bindings/display/tilcdc/panel.txt b/Documentation/devicetree/bindings/display/tilcdc/panel.txt
> >> index 808216310ea2..54963f9173cc 100644
> >> --- a/Documentation/devicetree/bindings/display/tilcdc/panel.txt
> >> +++ b/Documentation/devicetree/bindings/display/tilcdc/panel.txt
> >> @@ -1,5 +1,11 @@
> >>  Device-Tree bindings for tilcdc DRM generic panel output driver
> >>  
> >> +NOTE: This binding (and the related driver) is obsolete and should not
> >> +      be used anymore. Please refer to drm panel-common binding (and
> >> +      to a generic drm panel driver like panel-simple).
> >> +      Documentation/devicetree/bindings/display/panel/panel-common.yaml
> >> +      (drivers/gpu/drm/panel/panel-simple.c)
> >> +
> >>  Required properties:
> >>   - compatible: value should be "ti,tilcdc,panel".
> >>   - panel-info: configuration info to configure LCDC correctly for the panel

-- 
Regards,

Laurent Pinchart
