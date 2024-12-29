Return-Path: <linux-omap+bounces-2915-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 27F679FDF29
	for <lists+linux-omap@lfdr.de>; Sun, 29 Dec 2024 14:54:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8752F3A186A
	for <lists+linux-omap@lfdr.de>; Sun, 29 Dec 2024 13:54:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E00DC1487FA;
	Sun, 29 Dec 2024 13:53:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RW7IvELN"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72B09155308;
	Sun, 29 Dec 2024 13:53:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735480436; cv=none; b=Zu0IavBD2KdXmbrJbFlWQi4ysBVU8UIGK3xkx0ESYfcv45owmSVR8WsYn511ktqKMZbVrgyAaG5dJLXdclTCNJQCEvmS2h7syS/9H678xWE4gH/h7PLtCj+/iCFgSXpg6hR8b+XgK+ZM2l9hi26cSLgMVFo0ipSVw0plZcwJ+F8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735480436; c=relaxed/simple;
	bh=T2q2eFRvYpVUMngg9dcrGSpuvngYmfbs89OwtN4HfMA=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=PjUwHSccC0/v9j/sTtDxHaF4naS+fF5ZVUf/kqpsYxBTzFkEhi2mFzwNTbmsKym2WtEtfp1HgV3ngJihyO8BsdsD0C+vJeoK5Gk0FUkCaGMJJjoxgzjxDd7zj6hl1F88p/7QTWtbLPHB2TSR4V7qrwoynF3DMxtYQ4BFEOhvRg8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RW7IvELN; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2758AC4CED1;
	Sun, 29 Dec 2024 13:53:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735480435;
	bh=T2q2eFRvYpVUMngg9dcrGSpuvngYmfbs89OwtN4HfMA=;
	h=From:To:Cc:Subject:Date:From;
	b=RW7IvELNyYIG4JVl1jCCNG7ILuSaEkWB6f2ouX9eChYRcw4ohWvKRNqhpJHKDXDyH
	 T0gvuzfXVzu32GbLQNXbo/gpw6Nl/nN/K0/ED+V+JjE//Dz3ALlBFHxNZkQvnTmNXR
	 r/zC2keFHk0F8oJaOj+spAjSBlmBGmbeu5qMq3V1a4gbAxAf0QfCIvDhKmQNOl1I8b
	 de8rgL4eQLpy7ZWa1fXm3M74B+dkQKD5UrcduSVQTeuwXw6JUcHTBNjzuh07/1HxNp
	 R/ewRnANfDZiL9+dRikKQfYvnG+Gx+kWY87VBeRP9iuylbXAUsXxdtb9C/bZzLBCLD
	 iBV4ngLfQAUSg==
From: akemnade@kernel.org
To: Tero Kristo <kristo@kernel.org>,
	Andreas Kemnade <andreas@kemnade.info>,
	Tony Lindgren <tony@atomide.com>,
	devicetree@vger.kernel.org,
	Stephen Boyd <sboyd@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	linux-clk@vger.kernel.org,
	linux-omap@vger.kernel.org
Cc: Andreas Kemnade <akemnade@kernel.org>
Subject: [PATCH 0/2] dt-bindings: clocks: ti: Next round of conversion
Date: Sun, 29 Dec 2024 14:53:49 +0100
Message-Id: <20241229135351.5014-1-akemnade@kernel.org>
X-Mailer: git-send-email 2.39.5
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Andreas Kemnade <akemnade@kernel.org>

Convert more TI clock bindings to json-schema.

Andreas Kemnade (2):
  dt-bindings: clock: ti: Convert gate.txt to json-schema
  dt-bindings: clock: ti: Convert composite.txt to json-schema

 .../bindings/clock/ti/composite.txt           |  55 --------
 .../devicetree/bindings/clock/ti/gate.txt     | 105 ---------------
 .../bindings/clock/ti/ti,composite-clock.yaml |  80 ++++++++++++
 .../bindings/clock/ti/ti,gate-clock.yaml      | 123 ++++++++++++++++++
 4 files changed, 203 insertions(+), 160 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/clock/ti/composite.txt
 delete mode 100644 Documentation/devicetree/bindings/clock/ti/gate.txt
 create mode 100644 Documentation/devicetree/bindings/clock/ti/ti,composite-clock.yaml
 create mode 100644 Documentation/devicetree/bindings/clock/ti/ti,gate-clock.yaml

-- 
2.39.5


