Return-Path: <linux-omap+bounces-2714-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 71E139D4AE1
	for <lists+linux-omap@lfdr.de>; Thu, 21 Nov 2024 11:28:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 37967287FA8
	for <lists+linux-omap@lfdr.de>; Thu, 21 Nov 2024 10:28:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B699B1CACE9;
	Thu, 21 Nov 2024 10:28:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b="8tkkC4nj"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail.andi.de1.cc (mail.andi.de1.cc [178.238.236.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7339823099D;
	Thu, 21 Nov 2024 10:28:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.238.236.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732184885; cv=none; b=iK9B2xGOmHJdXdYZ2IYYKGzf6CWP3CUFrl1Jim4hSqtnn9VpFSBMUWvyiE5cPHVytf/+YGVAatRi8C9cVT3fCQaoF2ni2Os/wTbj0S6CyWWmENvagWCz4cIPtym9YG3wJdGkpDf//1EnR0xp4qQTyf0AaAr3gz+WqW+TC1Zlq9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732184885; c=relaxed/simple;
	bh=wtEHQkofAcnh3SC2zH1iKLgWqJq7luVnNBkLBFEBoVA=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Sz7sPrMzgNDExn2jkNmxsdheBB5Zpf3n+MOL7j+aArBgWLst7AB9n5MG8Tl7vDEzdxLftFfqY1Y1jb41Uvws+9ZXwCu7rmiyXku0RPB9wqEu/03ooyLa0JTmSL5gBHeMzNZeEsADghSv1SwIDiSuZzXCqJowe4mtlRjHL4a8JC8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info; spf=pass smtp.mailfrom=kemnade.info; dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b=8tkkC4nj; arc=none smtp.client-ip=178.238.236.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kemnade.info
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=References:In-Reply-To:Cc:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=iZHmtnZaPupw3FMfsjdu6r2fu38cHITN8Qp3hwNCkjo=; b=8tkkC4njub2Z5KoTXcXrawVgmc
	ukcXcionHr5Vxx7YETwGQ4TrCDaUBrwGqqYP+dBzxGoTObuwB2ZEFU1upGD2RYM6oBDeN4CIilGlT
	DpanqbLRVJjKqQx2N8jo6bMhNEQIMJmxYzhL+yctPUHAApT9Hyi27agMlQnlUmhW9NcnfD8vVuAuf
	3f+wLakC02wLli29reQBt8yjp0RxYZvjzigrtdmXGKZyODrX4Tb5wL6TFmLQ3uTdkIuNMAPTnleqm
	SoauXWaDy7XqLs8Ebh2Gy7IoyryF6puDb5A1sB5XI/9/mGAMb51BDZysmqc5eN/JJ9k1GIKHmYLTK
	txM04J1A==;
Date: Thu, 21 Nov 2024 11:27:50 +0100
From: Andreas Kemnade <andreas@kemnade.info>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-omap@vger.kernel.org, Hans Verkuil <hverkuil@xs4all.nl>, Linux
 Media Mailing List <linux-media@vger.kernel.org>, Sakari Ailus
 <sakari.ailus@linux.intel.com>
Subject: Re: [PATCH] media: staging: drop omap4iss
Message-ID: <20241121112750.3f5d4d2c@akair>
In-Reply-To: <20241120083938.GP12409@pendragon.ideasonboard.com>
References: <815a789d-85a5-44a1-8b9c-429ac0101e3f@xs4all.nl>
	<20241118200025.3daab676@akair>
	<20241119070222.GX31681@pendragon.ideasonboard.com>
	<20241120085406.4d864c6e@akair>
	<20241120083938.GP12409@pendragon.ideasonboard.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Am Wed, 20 Nov 2024 10:39:38 +0200
schrieb Laurent Pinchart <laurent.pinchart@ideasonboard.com>:

> Hi Andreas,
> 
> On Wed, Nov 20, 2024 at 08:54:06AM +0100, Andreas Kemnade wrote:
> > Am Tue, 19 Nov 2024 09:02:22 +0200 schrieb Laurent Pinchart:  
> > > On Mon, Nov 18, 2024 at 08:00:25PM +0100, Andreas Kemnade wrote:  
> > > > Am Mon, 2 Sep 2024 10:42:31 +0200 schrieb Hans Verkuil :
> > > >     
> > > > > The omap4 camera driver has seen no progress since forever, and
> > > > > now OMAP4 support has also been dropped from u-boot (1). So it is
> > > > > time to retire this driver.    
> > > > 
> > > > Argumenting with OMAP4 support in U-Boot is silly. That indicates that
> > > > there is no movement in keeping u-boot uptodate. Bootloader
> > > > development/updating is more risky especially if not done by the vendor,
> > > > good chances to brick something. And the bootloader might need
> > > > signing. So that argument is done nothing.
> > > > 
> > > > Better arguments would be to check if someone has something cooking and
> > > > feels not comfortable yet to climb Mount Upstream.
> > > > 
> > > > A good place to ask would be the omap platform
> > > > list: linux-omap@vger.kernel.org
> > > > 
> > > > I get still devicetrees for omap4 devices to review. So there is some
> > > > activity with omap4. If you look at postmarketOS you see also some
> > > > activity.
> > > > 
> > > > And also someone ported the driver to devicetree support:
> > > > https://github.com/iridia-ulb/meta-builderbot/blob/master/recipes-kernel/linux/linux-stable-4.16/0008-omap4iss-Fix-multiple-bugs-and-use-device-tree.patch
> > > > 
> > > > So the situation is not that simple. I am still evaluating it because I
> > > > myself have a device with omap4 and camera.    
> > > 
> > > Have you tested the camera recently ? The omap4iss driver has been
> > > unmaintained in mainline for a very, very long time, and I would be
> > > surprised if it worked.  
> > 
> > No, I have not tested it. I only have a bitrot out of tree driver for my
> > camera which was probably never used with omap. Vendor system seems to
> > handle camera via the m3 processor in a closed-source firmware blob. So
> > what is the overall picture:
> > 
> > Which omap4 devices have cameras? What is the status of the sensor
> > driver? Known working/Mainline/Out-of-tree/none? Datasheet for
> > sensor available?
> > The question is whether omap4iss can be tested together with a
> > known-working camera sensor driver. That would make things a lot easier.
> >
> > BT200 has a camera without mainline sensor driver.
> > Droid4 has also a camera. What is the status of the sensor driver?
> > What about the samsung-espresso tablets? And the xyboards?
> > 
> > Pandaboard camera module? If have a pandaboard I use for reference, but
> > no camera there.  
> 
> I used to work on it using a Pandaboard and an MT9P031 camera module,
> from Leopard Imaging if I recall correctly.
>
Hmm, that would require also soldering the connector and it seems like
no standard thing, so I would need to create an adaptor. At least I do
not find anything on ebay which looks like it can be attached to the
Pandaboard.

> > > If someone is interested in taking over maintainership and improving the
> > > driver to get it out of drivers/staging/ to drivers/media/, the removal
> > > can certainly be reverted. drivers/staging/ is not a place where drivers
> > > are left to bitrot, it's meant for active development of code not fully
> > > ready for mainline yet.  
> > 
> > I guess the way to start is to revert the remove and then update the
> > above-mentioned devicetree support patch. I have no feeling how complex
> > that whole task would be.  
> 
> That would be a first step, yes. After that, completing resizer support
> will be a good task candidate, followed by exposing the ISP parameters
> to userspace, and adding support for it to libcamera.
> 
Well, I guess before adding the resizer stuff, I want to see a picture
influenced by what is in front of the camera of a device I really care
about (!= pandaboard) and then adjusting things to the point where
format configurations are solved. At some point more could also jump
in to screw at sensor chip drivers.

Regards,
Andreas

