Return-Path: <linux-omap+bounces-4903-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B920C513E1
	for <lists+linux-omap@lfdr.de>; Wed, 12 Nov 2025 10:00:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id EA48334DCCD
	for <lists+linux-omap@lfdr.de>; Wed, 12 Nov 2025 09:00:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 11F6D2FE06F;
	Wed, 12 Nov 2025 08:59:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="yKwyZYl4"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A61882FE053
	for <linux-omap@vger.kernel.org>; Wed, 12 Nov 2025 08:59:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762937984; cv=none; b=gnnS0f+M4haQlsNtjerS+B9Ys/OMKxYK/RRQjGT9awNHvRaFSQTyE9MYavclAMOGtYkAAIOlN4MjITOyc7TbhbdJfqQx2zyb8CKaXT7WeAgEl8CcZa57Z/R8UU/ysXdnyM5TLj7hzwceNmKfuqpiXcDO/jtFEMY8u2OCt5Bklic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762937984; c=relaxed/simple;
	bh=fw6xRRSrEe6IvmtlKZd1GHXRPKMnz65H243RiUIEEfI=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tLBlAyeMSAgNmcjJLi/4Y+cd1eytRMkWj8bLsk+lPzr3dlzBrAmrGYQwE6oxQxz/QXXfXL+D2BC9bczUpuer8lkyBIp4v88nWJHhBEcrjh3X/vhqowJ5HjBAImrEnnhLqN/v0NP+JhEepyqCVKs3nv5MG4UYh9bBLl1a52mjzsU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=yKwyZYl4; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 0251D4E41665;
	Wed, 12 Nov 2025 08:59:41 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id C2BBE6070B;
	Wed, 12 Nov 2025 08:59:40 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9C7D31037170F;
	Wed, 12 Nov 2025 09:59:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1762937979; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=XgvHorkYlljZc4LneQOwVFrbrAMtL/782gZQ0/mOGIY=;
	b=yKwyZYl4dynT48ezsUgkoxmvzYd+FSQ9cbqH5KYFiCa/jACajVD8n/vtnbxf3pdaFiqpCu
	E2AwTCbX7yIYoGlv0rBSyKkRjEOjcdnxbIj7v+4Tu/I5u1eC/gRvlp/EZPWlFg7bG6wA+G
	L2Ef2HHXzqoRCBSY4ZeJy9DgCMgtVhsKasN9/zGySRsVBod4xGugR0X0a/3ZKQcBBZoX6/
	+HLfBuH7ym7aYM9IUM+aFIhxNdxPEymjckh53zcJkIC0qJyIZTEbl/Ojh48hoFGKp/lPOp
	LgUGLzWnOxPEhEEqqERuqQCqglx4gjEp9ajBSXdkiIm2wdXl3qRMV4L6z5DUwQ==
Date: Wed, 12 Nov 2025 09:59:34 +0100
From: Kory Maincent <kory.maincent@bootlin.com>
To: Lee Jones <lee@kernel.org>
Cc: kernel test robot <lkp@intel.com>, Aaro Koskinen <aaro.koskinen@iki.fi>,
 Andreas Kemnade <andreas@kemnade.info>, Kevin Hilman
 <khilman@baylibre.com>, Roger Quadros <rogerq@kernel.org>, Tony Lindgren
 <tony@atomide.com>, Shree Ramamoorthy <s-ramamoorthy@ti.com>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, oe-kbuild-all@lists.linux.dev, Andrew Davis
 <afd@ti.com>, Bajjuri Praneeth <praneeth@ti.com>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>, linux-omap@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 stable@vger.kernel.org
Subject: Re: [PATCH v2 1/2] mfd: tps65219: Implement LOCK register handling
 for TPS65214
Message-ID: <20251112095934.41dfe0a3@kmaincent-XPS-13-7390>
In-Reply-To: <20251110134221.GD1949330@google.com>
References: <20251106-fix_tps65219-v2-1-a7d608c4272f@bootlin.com>
	<202511070607.Il9q9meO-lkp@intel.com>
	<20251110134221.GD1949330@google.com>
Organization: bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3

On Mon, 10 Nov 2025 13:42:21 +0000
Lee Jones <lee@kernel.org> wrote:

> On Fri, 07 Nov 2025, kernel test robot wrote:
>=20
> > Hi Kory,
> >=20
> > kernel test robot noticed the following build warnings:
> >=20
> > [auto build test WARNING on 1c353dc8d962de652bc7ad2ba2e63f553331391c]
> >=20
> > url:
> > https://github.com/intel-lab-lkp/linux/commits/Kory-Maincent-TI-com/mfd=
-tps65219-Implement-LOCK-register-handling-for-TPS65214/20251106-185551
> > base:   1c353dc8d962de652bc7ad2ba2e63f553331391c patch link:
> > https://lore.kernel.org/r/20251106-fix_tps65219-v2-1-a7d608c4272f%40boo=
tlin.com
> > patch subject: [PATCH v2 1/2] mfd: tps65219: Implement LOCK register
> > handling for TPS65214 config: i386-buildonly-randconfig-003-20251107
> > (https://download.01.org/0day-ci/archive/20251107/202511070607.Il9q9meO=
-lkp@intel.com/config)
> > compiler: gcc-13 (Debian 13.3.0-16) 13.3.0 reproduce (this is a W=3D1 b=
uild):
> > (https://download.01.org/0day-ci/archive/20251107/202511070607.Il9q9meO=
-lkp@intel.com/reproduce)
> >=20
> > If you fix the issue in a separate patch/commit (i.e. not just a new
> > version of the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes:
> > https://lore.kernel.org/oe-kbuild-all/202511070607.Il9q9meO-lkp@intel.c=
om/
> >=20
> > All warnings (new ones prefixed by >>):
> >=20
> >    drivers/mfd/tps65219.c: In function 'tps65214_reg_write': =20
> > >> drivers/mfd/tps65219.c:479:26: warning: variable 'tps' set but not u=
sed
> > >> [-Wunused-but-set-variable] =20
> >      479 |         struct tps65219 *tps;
> >          |                          ^~~
> >=20
> >=20
> > vim +/tps +479 drivers/mfd/tps65219.c
> >=20
> >    475=09
> >    476	static int tps65214_reg_write(void *context, unsigned int
> > reg, unsigned int val) 477	{
> >    478		struct i2c_client *i2c =3D context; =20
> >  > 479		struct tps65219 *tps; =20
>=20
> Please fix.

Yes, I will do it this week, I was waiting for few days in case of more
reviews.

Regards,
--=20
K=C3=B6ry Maincent, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

