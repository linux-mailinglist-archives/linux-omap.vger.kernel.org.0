Return-Path: <linux-omap+bounces-2148-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6594896F7DC
	for <lists+linux-omap@lfdr.de>; Fri,  6 Sep 2024 17:09:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F133A2858BE
	for <lists+linux-omap@lfdr.de>; Fri,  6 Sep 2024 15:09:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE7521D279B;
	Fri,  6 Sep 2024 15:08:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="nxej4J1s"
X-Original-To: linux-omap@vger.kernel.org
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C41E1CCB2C;
	Fri,  6 Sep 2024 15:08:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725635337; cv=none; b=CTT+eF4LK6ut0xFjguoEddOjlukretr6kY9A97HF7nLIY287AJ8qx+dLKPxMZjJHj+fZ7ol/P1GQIAzN7aXNL0bSc72/g777vJoRR4Jne+/Bmk2q6dPs2o6MbzOHvL3emm2zMZJsoLcsgeLB4IHFmimxnywwmRTWfG5ArqEhSFk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725635337; c=relaxed/simple;
	bh=2SiaE3425A5JdlZpx8dNd6y6LVvenS+3fNMJQ4tbrKs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=P9kXqyvY3xbb0IQvTVw9XT4PxJnLZRt86uFR8a/jLgOOpeeIi05nswxa+S3j/J/6CfEzhBdKCtZMYn1j71pOzghOVaXMtWaFJf7rNGVMzO9uUs1saMa0QLJQ+IRbRyltuStLP3x7ELd9wChOPbAZdH8FK4KGR2aytSc2SCVG9hU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=nxej4J1s; arc=none smtp.client-ip=217.70.183.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id BC05EE000A;
	Fri,  6 Sep 2024 15:08:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1725635333;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9Ly2d9EwxQYn8DsfJBD5rt/wTDTZaYNKWP55jAE7dZA=;
	b=nxej4J1szwQNb1526tnOEqIYdaSYKyTg99r7lIAHy+8jraW2VD1gInuPLTh7TYgx1JR1dO
	49sUgcOl5cp/jMtfQP8+x6Sv/K3bYaa7akahCPO5igBULKjfrDdZQTG+cehBvOss+9IjSJ
	9nx+8alEBf9roHUCupZEq74/iYz1H4Qju5ZEHbOhlcqcYJ0JKt7EJGEfnTUNATFZ+ntZkV
	94KKc3q0ZBQqcfHevFK0EKtPPaJG2i3AQclVd0R6k97iQys6HdlrbRT17UPinIAPPp/mjD
	6hPMD0x34ZLlIfD9FdBwJ2dWnLrgsOVdILs8QTxurFHuk7P7Xr06xK1nNOQ8+A==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Roger Quadros <rogerq@kernel.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Tony Lindgren <tony@atomide.com>,
	Nishanth Menon <nm@ti.com>,
	Enric Balletbo i Serra <eballetbo@gmail.com>,
	Javier Martinez Canillas <javier@dowhile0.org>
Cc: srk@ti.com,
	linux-mtd@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-omap@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2] dt-bindings: mtd: ti, gpmc-nand: support partitions node
Date: Fri,  6 Sep 2024 17:08:52 +0200
Message-ID: <20240906150852.735663-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240903-gpmc-dtb-v2-1-8046c1915b96@kernel.org>
References: 
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'9e1a23aa86fc404af953e2ae8b1149a31f743f72'
Content-Transfer-Encoding: 8bit
X-GND-Sasl: miquel.raynal@bootlin.com

On Tue, 2024-09-03 at 16:29:57 UTC, Roger Quadros wrote:
> Allow fixed-partitions to be specified through a partitions
> node.
> 
> Fixes the below dtbs_check warning:
> 
> arch/arm64/boot/dts/ti/k3-am642-evm-nand.dtb: nand@0,0: Unevaluated properties are not allowed ('partitions' was unexpected)
> 
> Signed-off-by: Roger Quadros <rogerq@kernel.org>
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next, thanks.

Miquel

