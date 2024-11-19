Return-Path: <linux-omap+bounces-2707-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 144659D208D
	for <lists+linux-omap@lfdr.de>; Tue, 19 Nov 2024 08:02:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 54073B22075
	for <lists+linux-omap@lfdr.de>; Tue, 19 Nov 2024 07:02:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 734701531C2;
	Tue, 19 Nov 2024 07:02:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="M/ugtK5f"
X-Original-To: linux-omap@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6A1A35280;
	Tue, 19 Nov 2024 07:02:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731999766; cv=none; b=GW5/YZjeg5YPghFj0H7d8L5VQmSY4md38qiIAot7DXOFq/VEOgZsKYCNXVO0VMnclVcaaVYoxOxjrESPxDGxvZDvHrf8yxll1SyKBd7Ll4U3QFKT066OBRl0O4Gwm8TCvxoMdzAzv7awsvsKQ0KxDwgQbytCzYwT5h/K6NeBMws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731999766; c=relaxed/simple;
	bh=R3cteRh3bg4p/wNsT9Jk5cHldt7PQAOlyISpABdqKW0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ol1tEb5B02la+QD/4HoxQTHB7Vlf4tfCa3LPN1+9reNNSjqn7f+PGGhKm+oU0OiJR4h2CvYa6mmwFA1ZZYS/9CBZORbBKrt5pKVtS71UqHR6JxlyeFUIyr+yfYp67zVPoyXloZ75Z/kmk4Tm0kj+PW655A0qW9Jge8jqpD7hdmk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=M/ugtK5f; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5EEF11230;
	Tue, 19 Nov 2024 08:02:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1731999735;
	bh=R3cteRh3bg4p/wNsT9Jk5cHldt7PQAOlyISpABdqKW0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=M/ugtK5fyN+QV9wytgeuR8lBVoPw4BdDcWjVzCtS324ZL705twRetdQlqQKWLXlur
	 lAH5WoPFggYrwpWSWyLiQauYnjIAgBYVBhyj3zE/NZgUDxjQGjc/uT+pERIkKBbFni
	 1KCsA35JgBuvbTCgPXZjAlbKeafrqBxtE0pQCUTQ=
Date: Tue, 19 Nov 2024 09:02:22 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Andreas Kemnade <andreas@kemnade.info>
Cc: Hans Verkuil <hverkuil@xs4all.nl>, linux-omap@vger.kernel.org,
	Linux Media Mailing List <linux-media@vger.kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: Re: [PATCH] media: staging: drop omap4iss
Message-ID: <20241119070222.GX31681@pendragon.ideasonboard.com>
References: <815a789d-85a5-44a1-8b9c-429ac0101e3f@xs4all.nl>
 <20241118200025.3daab676@akair>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241118200025.3daab676@akair>

Hi Andreas,

On Mon, Nov 18, 2024 at 08:00:25PM +0100, Andreas Kemnade wrote:
> Am Mon, 2 Sep 2024 10:42:31 +0200 schrieb Hans Verkuil :
> 
> > The omap4 camera driver has seen no progress since forever, and
> > now OMAP4 support has also been dropped from u-boot (1). So it is
> > time to retire this driver.
> 
> Argumenting with OMAP4 support in U-Boot is silly. That indicates that
> there is no movement in keeping u-boot uptodate. Bootloader
> development/updating is more risky especially if not done by the vendor,
> good chances to brick something. And the bootloader might need
> signing. So that argument is done nothing.
> 
> Better arguments would be to check if someone has something cooking and
> feels not comfortable yet to climb Mount Upstream.
> 
> A good place to ask would be the omap platform
> list: linux-omap@vger.kernel.org
> 
> I get still devicetrees for omap4 devices to review. So there is some
> activity with omap4. If you look at postmarketOS you see also some
> activity.
> 
> And also someone ported the driver to devicetree support:
> https://github.com/iridia-ulb/meta-builderbot/blob/master/recipes-kernel/linux/linux-stable-4.16/0008-omap4iss-Fix-multiple-bugs-and-use-device-tree.patch
> 
> So the situation is not that simple. I am still evaluating it because I
> myself have a device with omap4 and camera.

Have you tested the camera recently ? The omap4iss driver has been
unmaintained in mainline for a very, very long time, and I would be
surprised if it worked.

If someone is interested in taking over maintainership and improving the
driver to get it out of drivers/staging/ to drivers/media/, the removal
can certainly be reverted. drivers/staging/ is not a place where drivers
are left to bitrot, it's meant for active development of code not fully
ready for mainline yet.

-- 
Regards,

Laurent Pinchart

