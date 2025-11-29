Return-Path: <linux-omap+bounces-5070-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D1F1C9408C
	for <lists+linux-omap@lfdr.de>; Sat, 29 Nov 2025 16:18:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 45DBF346D8C
	for <lists+linux-omap@lfdr.de>; Sat, 29 Nov 2025 15:18:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7682C1DF742;
	Sat, 29 Nov 2025 15:18:42 +0000 (UTC)
X-Original-To: linux-omap@vger.kernel.org
Received: from lithops.sigma-star.at (mailout.nod.at [116.203.167.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76B1F189B84;
	Sat, 29 Nov 2025 15:18:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=116.203.167.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764429522; cv=none; b=es/tuozjUL21kLlBQy3pxcYOkCufMrIhqa+odegI3mzZitBVtttcqCvFvo7oET1HFe78urooEgJ15keZvxpa52qm3KTOUqB//zAoeBOBH1qLS/eiJQCeLKIdt7V6Sm7B5O7sjJU+uaOgP908vKivCKM+hlDmWkUA1rTa/gc/huw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764429522; c=relaxed/simple;
	bh=J3cipEaybpHTdwIhJrqAyxsTqM/AiUJ4FSIorDQrTAQ=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=TmKzk80ac0jk/jTkWWA4bbr02jjnJQy8kYQjSQ3Uf0nU1t1SkppOf6KHqXvW7fv/yqh7ZqbVPHaV5rYtvBU0Hp5h7cJQ3PSlhuK957qUXR+9U59ooZ8GIRNK/dMX6ZDzJikkpowdkhPF56DfRKa71ZmdxLGmZA/RseTQsiEYeEU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nod.at; spf=fail smtp.mailfrom=nod.at; arc=none smtp.client-ip=116.203.167.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nod.at
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nod.at
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id 5A1902ABFDC;
	Sat, 29 Nov 2025 16:18:37 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id 3-3q397sa7M9; Sat, 29 Nov 2025 16:18:36 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id BDF7111C05C;
	Sat, 29 Nov 2025 16:18:35 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id SpTLUuCX8Row; Sat, 29 Nov 2025 16:18:35 +0100 (CET)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
	by lithops.sigma-star.at (Postfix) with ESMTP id 8886F2C14AA;
	Sat, 29 Nov 2025 16:18:35 +0100 (CET)
Date: Sat, 29 Nov 2025 16:18:35 +0100 (CET)
From: Richard Weinberger <richard@nod.at>
To: Andreas Kemnade <andreas@kemnade.info>
Cc: linux-kernel <linux-kernel@vger.kernel.org>, linux-omap@vger.kernel.org, 
	devicetree <devicetree@vger.kernel.org>, 
	Arnd Bergmann <arnd@arndb.de>, Lee Jones <lee@kernel.org>, 
	dakr@kernel.org, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Mark Brown <broonie@kernel.org>, tony@atomide.com, rogerq@kernel.org, 
	khilman@baylibre.com, aaro koskinen <aaro.koskinen@iki.fi>, 
	Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, robh <robh@kernel.org>
Message-ID: <253085958.4428.1764429515315.JavaMail.zimbra@nod.at>
In-Reply-To: <20251129153644.333498f1@kemnade.info>
References: <20251129142042.344359-1-richard@nod.at> <20251129153644.333498f1@kemnade.info>
Subject: Re: [PATCH 0/4] Add tooling to disable debugfs on OMAP based
 systems
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF144 (Linux)/8.8.12_GA_3809)
Thread-Topic: Add tooling to disable debugfs on OMAP based systems
Thread-Index: ice++2tPGd+aipsod6lFeidVZflPZw==

----- Urspr=C3=BCngliche Mail -----
> Von: "Andreas Kemnade" <andreas@kemnade.info>
> it is usually not about individual registers, but about accessing
> unpowered devices/modules,
>=20
> so it is probably more the logic like:
>=20
> if (pm_runtime_is_suspended(regmap->device))
>=09-EACCESS;
>=20
> Try to play around with on >power/control in sysfs.

Well the that regmap is owned by the syscon mfd.
And in case of CTRL_MODULE_CORE only accessing some reserved registers caus=
es
an abort.

For registers like dsp_system@40d00000 it's maybe indeed due to an unpowere=
d module.
I'll double check that.
=20
>> So, add tooling to allow disabling debugfs access to such dangerous regi=
sters.
>> Splitting the register map definitions in the device tree seemed less pr=
actical
>> to
>> me since it would unnecessarily make the device trees more complicated.
>>=20
> So is it really a description of the hardware? Maybe there are some speci=
al
> cases, too.

IMHO, "There are problematic registers, don't blindly mess with them" is a =
description of the hardware.

Thanks,
//richard

