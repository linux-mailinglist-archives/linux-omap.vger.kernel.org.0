Return-Path: <linux-omap+bounces-2711-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A36FF9D34D7
	for <lists+linux-omap@lfdr.de>; Wed, 20 Nov 2024 08:55:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6910D282984
	for <lists+linux-omap@lfdr.de>; Wed, 20 Nov 2024 07:55:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 95267165F18;
	Wed, 20 Nov 2024 07:54:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b="7RkRv+5J"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail.andi.de1.cc (mail.andi.de1.cc [178.238.236.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A8F0487A7;
	Wed, 20 Nov 2024 07:54:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.238.236.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732089254; cv=none; b=WFl0+NOU5YmoO7M2ziJ083/Um7Wh82ew9uNx94C2k+YRMUx/twcznnTOUx9XKkW/Yrv/MJ/IJhYHOpBS9t6154g6qmMweFL+LbAkjKZl7KxKIeL0CkrrIwWEScizvud1TZpoolaTvtt4wU9u4tOmgjNXcGUoNe/y4z2ofE9nEi8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732089254; c=relaxed/simple;
	bh=UGiUqgDPOcvvTbtd9hMZZn2oM2VybJ7NOSs+8C92cko=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JbVMfeBQFsssekbhShgQ1EXZIIORr5yUr7TgMsDsT9aGpm4L4798R7Q+WkxYkLCH0cIGPxYwZHkvHtifob9xJaU56PXs2H5EF0VZY5DqYlo3vR17q2VjoLLxbR/n4CttbVTDhlapdmPQBXnxF3k/rdm9Q5j2hHnyB+sZvHhm+GA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info; spf=pass smtp.mailfrom=kemnade.info; dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b=7RkRv+5J; arc=none smtp.client-ip=178.238.236.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kemnade.info
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=References:In-Reply-To:Cc:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=2zph7Rj9SRge9mIt+IdQK0HEAiiD0TzeL0g0wgyMkWM=; b=7RkRv+5JWP/DCE/wtXP2HyoMsl
	O0BEp4Ti5UfwSigLbiBihRf81zuMHTV6ozQ0By8NULKrUoud/P7Up/EpR0ZpgSXBsyqgYMf3DCQKF
	QfC5gD/bRVzkemC68IRiOQwAVr0g34sLn4me4pz9436NGY8W+QcOwctkeISBE4YLA4F41Dcj32qHr
	P9waRqZx3sW4FBanauvPKFiGlKUhfFoukB4EWubKeJaZzJ3wJZ803YWDmJE45fHUKA8QAgNS9T0GO
	XppSJHaoi1gck3pul3T6CeGAyx+x9LFix7LazyIP8r5gAvbAUgeWEh3vPITjGkfjkZobIQHU2cZez
	GOlW71nA==;
Date: Wed, 20 Nov 2024 08:54:06 +0100
From: Andreas Kemnade <andreas@kemnade.info>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 linux-omap@vger.kernel.org
Cc: Hans Verkuil <hverkuil@xs4all.nl>, Linux Media Mailing List
 <linux-media@vger.kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: Re: [PATCH] media: staging: drop omap4iss
Message-ID: <20241120085406.4d864c6e@akair>
In-Reply-To: <20241119070222.GX31681@pendragon.ideasonboard.com>
References: <815a789d-85a5-44a1-8b9c-429ac0101e3f@xs4all.nl>
 <20241118200025.3daab676@akair>
 <20241119070222.GX31681@pendragon.ideasonboard.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Am Tue, 19 Nov 2024 09:02:22 +0200
schrieb Laurent Pinchart <laurent.pinchart@ideasonboard.com>:

> Hi Andreas,
> 
> On Mon, Nov 18, 2024 at 08:00:25PM +0100, Andreas Kemnade wrote:
> > Am Mon, 2 Sep 2024 10:42:31 +0200 schrieb Hans Verkuil :
> >   
> > > The omap4 camera driver has seen no progress since forever, and
> > > now OMAP4 support has also been dropped from u-boot (1). So it is
> > > time to retire this driver.  
> > 
> > Argumenting with OMAP4 support in U-Boot is silly. That indicates that
> > there is no movement in keeping u-boot uptodate. Bootloader
> > development/updating is more risky especially if not done by the vendor,
> > good chances to brick something. And the bootloader might need
> > signing. So that argument is done nothing.
> > 
> > Better arguments would be to check if someone has something cooking and
> > feels not comfortable yet to climb Mount Upstream.
> > 
> > A good place to ask would be the omap platform
> > list: linux-omap@vger.kernel.org
> > 
> > I get still devicetrees for omap4 devices to review. So there is some
> > activity with omap4. If you look at postmarketOS you see also some
> > activity.
> > 
> > And also someone ported the driver to devicetree support:
> > https://github.com/iridia-ulb/meta-builderbot/blob/master/recipes-kernel/linux/linux-stable-4.16/0008-omap4iss-Fix-multiple-bugs-and-use-device-tree.patch
> > 
> > So the situation is not that simple. I am still evaluating it because I
> > myself have a device with omap4 and camera.  
> 
> Have you tested the camera recently ? The omap4iss driver has been
> unmaintained in mainline for a very, very long time, and I would be
> surprised if it worked.
> 
No, I have not tested it. I only have a bitrot out of tree driver for my
camera which was probably never used with omap. Vendor system seems to
handle camera via the m3 processor in a closed-source firmware blob. So
what is the overall picture:

Which omap4 devices have cameras? What is the status of the sensor
driver? Known working/Mainline/Out-of-tree/none? Datasheet for
sensor available?
The question is whether omap4iss can be tested together with a
known-working camera sensor driver. That would make things a lot easier.

BT200 has a camera without mainline sensor driver.
Droid4 has also a camera. What is the status of the sensor driver?
What about the samsung-espresso tablets? And the xyboards?

Pandaboard camera module? If have a pandaboard I use for reference, but
no camera there.

> If someone is interested in taking over maintainership and improving the
> driver to get it out of drivers/staging/ to drivers/media/, the removal
> can certainly be reverted. drivers/staging/ is not a place where drivers
> are left to bitrot, it's meant for active development of code not fully
> ready for mainline yet.
> 
I guess the way to start is to revert the remove and then update the
above-mentioned devicetree support patch. I have no feeling how complex
that whole task would be.

Regards,
Andreas

