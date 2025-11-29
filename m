Return-Path: <linux-omap+bounces-5069-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CEF3BC93FED
	for <lists+linux-omap@lfdr.de>; Sat, 29 Nov 2025 15:37:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4B6B73A3E3C
	for <lists+linux-omap@lfdr.de>; Sat, 29 Nov 2025 14:37:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7697530F818;
	Sat, 29 Nov 2025 14:37:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b="KDptpUkz"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail.andi.de1.cc (mail.andi.de1.cc [178.238.236.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71D562475CF;
	Sat, 29 Nov 2025 14:36:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.238.236.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764427020; cv=none; b=pLr5uDfUtxM0weG3lnpOqoiyPjXRB44SGQQmz61lzf2obLIHm3kFQUEkUzYkaQgNFOjGO8yT3aI7K7/ZPJo+a06eIhpbvbOLKAYz1oVnaDrX6/mC2Xzt1XyENWw9ri1bbMqsTxoKBXhUvZm10ssh6H1Z5G/3IXxjrGFfGT4NCkk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764427020; c=relaxed/simple;
	bh=fkkZs0BHHYJz241C9Yejcjbwgf39zopA+acY4y5VACI=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=uobeKDKziVJR3bwbLJVYG+QYpsnWo0bmFmNZU0CxZTNlUhhIPW8+oRaRX5gPNKPSJyNNkomaa+o1EPH8q+oCyPJqA2P8GnZkbnaWA0SBNWMc/O8d96lrCFK0MNl2Bni3E03H6RjSWcWAWfqeFVOFXDWFaVLD5uG4IT31axUvsIs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info; spf=pass smtp.mailfrom=kemnade.info; dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b=KDptpUkz; arc=none smtp.client-ip=178.238.236.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kemnade.info
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=References:In-Reply-To:Cc:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=YQYQNIBjutVQYKcmC+ssxMTG4I6ddDM9E4e59eXLpgI=; b=KDptpUkz63QGNNA21M7nddoplv
	AJgjcNk0gVGhU6T5hEIhf/kXduM5dHntCJF9EIRKvj8+DCEMKa8aLGTyXPP3xdRo3bEbNG4eQDXkh
	ZFlZFA3XyWE7MiD8mutIIZXDQRcHXFecr+VxZi2BVFZz1FPQmIo3nQqMs90hgYrvBXDqlGBV1nIXy
	sjuvanQLVhighMVIf4wb/f5/nQLbw+eGbvpbGa2U1EED8YlafLEBrfRvAUfr0wh/zx+sDbStOr+UJ
	V2BuzAzU94XU3ql0qVjRXWQua093Nb+8DtLCuvZUC38wWUdssMP9/LWv5XDBysnSml3o2uIljxs06
	CgxF9IAw==;
Date: Sat, 29 Nov 2025 15:36:44 +0100
From: Andreas Kemnade <andreas@kemnade.info>
To: Richard Weinberger <richard@nod.at>
Cc: linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org,
 devicetree@vger.kernel.org, arnd@arndb.de, lee@kernel.org, dakr@kernel.org,
 rafael@kernel.org, gregkh@linuxfoundation.org, broonie@kernel.org,
 tony@atomide.com, rogerq@kernel.org, khilman@baylibre.com,
 aaro.koskinen@iki.fi, conor+dt@kernel.org, krzk+dt@kernel.org,
 robh@kernel.org
Subject: Re: [PATCH 0/4] Add tooling to disable debugfs on OMAP based
 systems
Message-ID: <20251129153644.333498f1@kemnade.info>
In-Reply-To: <20251129142042.344359-1-richard@nod.at>
References: <20251129142042.344359-1-richard@nod.at>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; aarch64-unknown-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sat, 29 Nov 2025 15:20:38 +0100
Richard Weinberger <richard@nod.at> wrote:

> It came to my attention that commands such as `grep -r / -e ...` can cause
> crashes on an AM572x based system.
> An investigation found that reading from various files in /sys/kernel/debug/regmap
> causes imprecise async data aborts.
> 
> One of these register maps is the CTRL_MODULE_CORE register map at 0x4A002000.
> It contains various registers marked as reserved, but the manual indicates
> that read access is still allowed.
> On said system, reading from most registers seems to work, but for some
> an async data abort happens. So it's not entirely clear what registers are safe
> and which are not.
> 
it is usually not about individual registers, but about accessing 
unpowered devices/modules,

so it is probably more the logic like:

if (pm_runtime_is_suspended(regmap->device))
	-EACCESS;

Try to play around with on >power/control in sysfs.

> So, add tooling to allow disabling debugfs access to such dangerous registers.
> Splitting the register map definitions in the device tree seemed less practical to
> me since it would unnecessarily make the device trees more complicated.
> 
So is it really a description of the hardware? Maybe there are some special
cases, too.

Regards,
Andreas

