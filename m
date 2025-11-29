Return-Path: <linux-omap+bounces-5066-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 116EBC93F51
	for <lists+linux-omap@lfdr.de>; Sat, 29 Nov 2025 15:22:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 6BADA34441B
	for <lists+linux-omap@lfdr.de>; Sat, 29 Nov 2025 14:22:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4FB2730FC1C;
	Sat, 29 Nov 2025 14:22:26 +0000 (UTC)
X-Original-To: linux-omap@vger.kernel.org
Received: from lithops.sigma-star.at (mailout.nod.at [116.203.167.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAC1A2EB859;
	Sat, 29 Nov 2025 14:22:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=116.203.167.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764426146; cv=none; b=NULBLOhZE2BX1IbmVhzyeyJkiIkZiQTHS3aS57lD2/6zHJCu8t2O1FJe9oDG4iVGuU9X1R4y/z1ylJrMlM44lO59XP4IEGH51NL3X3ArmG0G2UpNAY6F+slYaDbf6DNNxejt6HPHdXs81MHQOmoQ5G0akYNtHJpC2hHxj/zdMWk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764426146; c=relaxed/simple;
	bh=OMgHZRBGjXikokEvURkvlGkbcaPlZ3k3EHUVnYFqmUg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=l28xzPnkM9CbJhGTobbBtOsg7TEfMYV1Eua3kEyYQF42dw9ZoBcJWUJ8XH5DXHfrxeZ4ydyMsjrNkq/mjmYR0lKQkROhHM/ad1683PxkbFQDkdyG5NdPuHIn6d6+L4HGQhaZ/YQlVtV5CL9sdCfmeTlNiDsrbThEx499lUefoEw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nod.at; spf=fail smtp.mailfrom=nod.at; arc=none smtp.client-ip=116.203.167.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nod.at
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nod.at
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id B19E22CE365;
	Sat, 29 Nov 2025 15:22:15 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id 4NsLg4MZb1FA; Sat, 29 Nov 2025 15:22:15 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id 537AA2CE378;
	Sat, 29 Nov 2025 15:22:15 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id FAa72EJt4vaQ; Sat, 29 Nov 2025 15:22:15 +0100 (CET)
Received: from nailgun.corp.sigma-star.at (85-127-105-34.dsl.dynamic.surfer.at [85.127.105.34])
	by lithops.sigma-star.at (Postfix) with ESMTPSA id A00C52C14AB;
	Sat, 29 Nov 2025 15:22:14 +0100 (CET)
From: Richard Weinberger <richard@nod.at>
To: linux-kernel@vger.kernel.org
Cc: linux-omap@vger.kernel.org,
	devicetree@vger.kernel.org,
	arnd@arndb.de,
	lee@kernel.org,
	dakr@kernel.org,
	rafael@kernel.org,
	gregkh@linuxfoundation.org,
	broonie@kernel.org,
	tony@atomide.com,
	rogerq@kernel.org,
	khilman@baylibre.com,
	andreas@kemnade.info,
	aaro.koskinen@iki.fi,
	conor+dt@kernel.org,
	krzk+dt@kernel.org,
	robh@kernel.org,
	Richard Weinberger <richard@nod.at>
Subject: [PATCH 1/4] dt-bindings: Document new common property: has-inaccessible-regs
Date: Sat, 29 Nov 2025 15:20:39 +0100
Message-ID: <20251129142042.344359-2-richard@nod.at>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251129142042.344359-1-richard@nod.at>
References: <20251129142042.344359-1-richard@nod.at>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

This property is used to denote that a certain register map contains
registers that are inaccessible under conditions only a device driver
can know.
The purpose of this property is to disable register access through debug
facilities outside of the device driver.

Signed-off-by: Richard Weinberger <richard@nod.at>
---
 .../devicetree/bindings/common-properties.txt        | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/Documentation/devicetree/bindings/common-properties.txt b/Do=
cumentation/devicetree/bindings/common-properties.txt
index 98a28130e100f..edf6d0b8cf1b1 100644
--- a/Documentation/devicetree/bindings/common-properties.txt
+++ b/Documentation/devicetree/bindings/common-properties.txt
@@ -83,3 +83,15 @@ gpio@0 {
 	      #gpio-cells =3D <2>;
 	      #daisy-chained-devices =3D <3>;
 };
+
+Inaccessible registers
+----------------------
+
+If a register map as described by the 'reg' property contains registers
+that cannot be accessed for various reasons and splitting the register
+definition is not possible, use this property to denote that uncontrolle=
d
+access outside of a device driver should be disabled.
+On Linux, for example, this disables regmap debugfs access
+
+Optional properties:
+- has-inaccessible-regs: Boolean
--=20
2.51.0


