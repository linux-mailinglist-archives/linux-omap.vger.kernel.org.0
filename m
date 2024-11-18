Return-Path: <linux-omap+bounces-2706-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 31E3B9D189F
	for <lists+linux-omap@lfdr.de>; Mon, 18 Nov 2024 20:00:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A5CC81F22A0A
	for <lists+linux-omap@lfdr.de>; Mon, 18 Nov 2024 19:00:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5838D1DED64;
	Mon, 18 Nov 2024 19:00:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b="rdYsxb68"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail.andi.de1.cc (mail.andi.de1.cc [178.238.236.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 429341E505;
	Mon, 18 Nov 2024 19:00:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.238.236.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731956435; cv=none; b=aFhaH9QJwASPw/s/Kbdjd4ciu5Vi7uIiGLxO/wB6yaWv81T7Fjm8wMPrafWT/XDPShFOi5trKa8m75i5rJAi/k3xCq8tw/Dq6JBW0jcbMpM9/EtNjqmdxYmz+eIfJYL+cfAA8vkkRDiLQRmqc/NQRWL1Er0Z++66mFqCm/yOQh4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731956435; c=relaxed/simple;
	bh=XjXHK61J9m3VilEeKQw5i1RBj2nb90A7XKuYcX3hTOA=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LRezVKic9rRb+mnZQ3FfidEfxGabcctPzGgXvZ+v12HHgHXDALtegXwlo9Q+SK3I+cx7TI1IpP1jwPxIBKtLpVLNj0y0DCIwbvKOT/pm3gV2/634rcM5qavU+rpN6WL6f7R5ycosqFOVYiQuCR1E9lcbYM+WVUnN0KQLJB49PkI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info; spf=pass smtp.mailfrom=kemnade.info; dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b=rdYsxb68; arc=none smtp.client-ip=178.238.236.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kemnade.info
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=References:In-Reply-To:Cc:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=4oZ/hwgL6Gbt8d1E3JnoAa6LSmeKAPNvcME1TfCCCbE=; b=rdYsxb68BrAOLb2ePEc7uGReFF
	aNmjydnpizo0y+3cUQbDy/1ZrydzkTWlwB85nK6bZTU7GbnwRLytSrqrqJOwtXv7FMAFWtguYyGij
	f3nJT1holkCB5cLtIBAOgN5P82yfWbJ2FYb4nUPbl4+TYjlupfsWpfrXcV43HBHU6PmrgZQzMZE6a
	mRgfsOw8AfyuMN8+rO83Twe5iuvug7CW1QGZpr8VeI7NUN2f+a0/O7pqtdcsy9FKiweNnprJsjk1c
	mq2DnTAQlkKWdgFOj+cq2vxNz73aTSnkZjHEm+81M4fvFm5AVV6qCDDfbc+zM1ML7463nIAwG9d6w
	jrtUFhyw==;
Date: Mon, 18 Nov 2024 20:00:25 +0100
From: Andreas Kemnade <andreas@kemnade.info>
To: Hans Verkuil <hverkuil@xs4all.nl>, linux-omap@vger.kernel.org
Cc: Linux Media Mailing List <linux-media@vger.kernel.org>, Sakari Ailus
 <sakari.ailus@linux.intel.com>, Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH] media: staging: drop omap4iss
Message-ID: <20241118200025.3daab676@akair>
In-Reply-To: <815a789d-85a5-44a1-8b9c-429ac0101e3f@xs4all.nl>
References: <815a789d-85a5-44a1-8b9c-429ac0101e3f@xs4all.nl>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Am Mon, 2 Sep 2024 10:42:31 +0200
schrieb Hans Verkuil <hverkuil@xs4all.nl>:

> The omap4 camera driver has seen no progress since forever, and
> now OMAP4 support has also been dropped from u-boot (1). So it is
> time to retire this driver.
> 

Argumenting with OMAP4 support in U-Boot is silly. That indicates that
there is no movement in keeping u-boot uptodate. Bootloader
development/updating is more risky especially if not done by the vendor,
good chances to brick something. And the bootloader might need
signing. So that argument is done nothing.

Better arguments would be to check if someone has something cooking and
feels not comfortable yet to climb Mount Upstream.

A good place to ask would be the omap platform
list: linux-omap@vger.kernel.org

I get still devicetrees for omap4 devices to review. So there is some
activity with omap4. If you look at postmarketOS you see also some
activity.

And also someone ported the driver to devicetree support:
https://github.com/iridia-ulb/meta-builderbot/blob/master/recipes-kernel/linux/linux-stable-4.16/0008-omap4iss-Fix-multiple-bugs-and-use-device-tree.patch

So the situation is not that simple. I am still evaluating it because I
myself have a device with omap4 and camera.

Regards,
Andreas

