Return-Path: <linux-omap+bounces-2712-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C4109D35A6
	for <lists+linux-omap@lfdr.de>; Wed, 20 Nov 2024 09:40:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 107561F25B17
	for <lists+linux-omap@lfdr.de>; Wed, 20 Nov 2024 08:40:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DCE2E178368;
	Wed, 20 Nov 2024 08:39:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Mv7F+UQ4"
X-Original-To: linux-omap@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96CDA1422C7;
	Wed, 20 Nov 2024 08:39:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732091998; cv=none; b=dmOTUqg7DpLwXOYff10v3B+CssXrKxs/MZxzNyPDAG8rRLVLf5DFcHUI45IuM0+/iw+rJHNQ0jT+P/kK7D55w0rKAKTpooT6VR5wa6z5sLsDMVe8wpW81TiRBjkg362henuviTl3D0ikeSsizwPclzViQbIiYvmt2mXPKW9/FtI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732091998; c=relaxed/simple;
	bh=EMejAXYhL2K3pvo1y4VVTUaMJsPAaX8OevAmjgn7ucs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UadU2Ud71tm71H6ToW6aSv4f83uBA7jegEkVLqJLZ+H2IhjmGphn61LcSDjjrYTurWk9ASx7hAjcbg50lSbicv6dZXgjsZmT97WTlTJPJ3OgQS/UXHPTycFWf4+/HgVIukC4bMASrdK8bISoS33t0+GUzAn/Pb7yD2wl5tAEHf8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Mv7F+UQ4; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1C61155A;
	Wed, 20 Nov 2024 09:39:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1732091970;
	bh=EMejAXYhL2K3pvo1y4VVTUaMJsPAaX8OevAmjgn7ucs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Mv7F+UQ4moggCGh6ph13lDTvNYD12Pbiu6P48eProqLGvL0GvXEmidz+BE7jvdjNe
	 oIL7LegVLPTzsp5IIYIIv8iyBOYxkIaRgyzfAYJYyBbUBcB96P4pdtap3FLfWfJq0t
	 ucu75Sww18mmaigA9UgRJME3yFEMrh9sn1QcpA0g=
Date: Wed, 20 Nov 2024 10:39:38 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Andreas Kemnade <andreas@kemnade.info>
Cc: linux-omap@vger.kernel.org, Hans Verkuil <hverkuil@xs4all.nl>,
	Linux Media Mailing List <linux-media@vger.kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: Re: [PATCH] media: staging: drop omap4iss
Message-ID: <20241120083938.GP12409@pendragon.ideasonboard.com>
References: <815a789d-85a5-44a1-8b9c-429ac0101e3f@xs4all.nl>
 <20241118200025.3daab676@akair>
 <20241119070222.GX31681@pendragon.ideasonboard.com>
 <20241120085406.4d864c6e@akair>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241120085406.4d864c6e@akair>

Hi Andreas,

On Wed, Nov 20, 2024 at 08:54:06AM +0100, Andreas Kemnade wrote:
> Am Tue, 19 Nov 2024 09:02:22 +0200 schrieb Laurent Pinchart:
> > On Mon, Nov 18, 2024 at 08:00:25PM +0100, Andreas Kemnade wrote:
> > > Am Mon, 2 Sep 2024 10:42:31 +0200 schrieb Hans Verkuil :
> > >   
> > > > The omap4 camera driver has seen no progress since forever, and
> > > > now OMAP4 support has also been dropped from u-boot (1). So it is
> > > > time to retire this driver.  
> > > 
> > > Argumenting with OMAP4 support in U-Boot is silly. That indicates that
> > > there is no movement in keeping u-boot uptodate. Bootloader
> > > development/updating is more risky especially if not done by the vendor,
> > > good chances to brick something. And the bootloader might need
> > > signing. So that argument is done nothing.
> > > 
> > > Better arguments would be to check if someone has something cooking and
> > > feels not comfortable yet to climb Mount Upstream.
> > > 
> > > A good place to ask would be the omap platform
> > > list: linux-omap@vger.kernel.org
> > > 
> > > I get still devicetrees for omap4 devices to review. So there is some
> > > activity with omap4. If you look at postmarketOS you see also some
> > > activity.
> > > 
> > > And also someone ported the driver to devicetree support:
> > > https://github.com/iridia-ulb/meta-builderbot/blob/master/recipes-kernel/linux/linux-stable-4.16/0008-omap4iss-Fix-multiple-bugs-and-use-device-tree.patch
> > > 
> > > So the situation is not that simple. I am still evaluating it because I
> > > myself have a device with omap4 and camera.  
> > 
> > Have you tested the camera recently ? The omap4iss driver has been
> > unmaintained in mainline for a very, very long time, and I would be
> > surprised if it worked.
> 
> No, I have not tested it. I only have a bitrot out of tree driver for my
> camera which was probably never used with omap. Vendor system seems to
> handle camera via the m3 processor in a closed-source firmware blob. So
> what is the overall picture:
> 
> Which omap4 devices have cameras? What is the status of the sensor
> driver? Known working/Mainline/Out-of-tree/none? Datasheet for
> sensor available?
> The question is whether omap4iss can be tested together with a
> known-working camera sensor driver. That would make things a lot easier.
>
> BT200 has a camera without mainline sensor driver.
> Droid4 has also a camera. What is the status of the sensor driver?
> What about the samsung-espresso tablets? And the xyboards?
> 
> Pandaboard camera module? If have a pandaboard I use for reference, but
> no camera there.

I used to work on it using a Pandaboard and an MT9P031 camera module,
from Leopard Imaging if I recall correctly.

> > If someone is interested in taking over maintainership and improving the
> > driver to get it out of drivers/staging/ to drivers/media/, the removal
> > can certainly be reverted. drivers/staging/ is not a place where drivers
> > are left to bitrot, it's meant for active development of code not fully
> > ready for mainline yet.
> 
> I guess the way to start is to revert the remove and then update the
> above-mentioned devicetree support patch. I have no feeling how complex
> that whole task would be.

That would be a first step, yes. After that, completing resizer support
will be a good task candidate, followed by exposing the ISP parameters
to userspace, and adding support for it to libcamera.

All it takes is a volunteer maintainer for the driver, with enough time
and motivation :-)

-- 
Regards,

Laurent Pinchart

