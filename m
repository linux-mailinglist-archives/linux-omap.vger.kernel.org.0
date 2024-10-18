Return-Path: <linux-omap+bounces-2453-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DD9239A392A
	for <lists+linux-omap@lfdr.de>; Fri, 18 Oct 2024 10:54:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9E638284CA9
	for <lists+linux-omap@lfdr.de>; Fri, 18 Oct 2024 08:54:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 662D518FDA3;
	Fri, 18 Oct 2024 08:53:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b="io1WQ6BM"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail.andi.de1.cc (mail.andi.de1.cc [178.238.236.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C58118E025;
	Fri, 18 Oct 2024 08:53:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.238.236.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729241639; cv=none; b=uaObqEIBq8+sKNA0QlEPMnTgAc1ZsT90UWpr0ov/KV1kkr1+Co7BLHESOuUOwxFnfrhXoZog/qF6lOhajOJSRKDuJqd6ViuJFhEu05FVBF9hmN6HLjHG7Is0wzjKXR14/8jvX6ACdWHWo2zidgk00+jVRtsGUdccb0whKtVdSH4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729241639; c=relaxed/simple;
	bh=gr4U4FR4wkY2logh188gOxCC238FaP96WXZwHvzj8FM=;
	h=From:To:Subject:Date:Message-Id:Content-Type:MIME-Version; b=Qs6507Y7YMMqjOWxnG51RZjgbFKZ78DQLwrV340Jo3hkN4x/P5HU5xQrAsAj3zlAg2QwfOvpg4Vb6DRheUhoFl/sDBOsmJgqJb1dHhKoH3m/AM05Aw/U0osd0/sac8TAXfkaMZwbw5QqD18io07nrsnb6r+iCY60LrX1qKZ9FcM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info; spf=pass smtp.mailfrom=kemnade.info; dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b=io1WQ6BM; arc=none smtp.client-ip=178.238.236.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kemnade.info
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=From:Sender:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References;
	bh=lmIYE7z4RuGhJ36QE482hSQEIKsxx2xUyL9F6iQ0AgQ=; b=io1WQ6BMMsW7iYFReW6Gly4bN7
	YZCt/CT1FGAsqBFHn1cX/NL8sjMFIfdRyNYnTppZd8OwMCIdjXcd6A98mn18G3++bVBJNeN2QJ/kp
	HpNM3FfA1UpH38UsVPwn7zZ6xBWUBXovHF6GrWqaAS6z/uJURVo7DxRCc8bwWhMUgr8Qw1BVmrtsW
	Dk0y96ZvyXkoIJPYh56v0CH962HqKfkY2+WzUJkcf4LGrM8XJAc2JCe0mCUJKJWCA4sf5tMb17YKY
	O7cRIvUeyzIkmFXQwJh5maoeKgqaUNUacNoQawyjW4Fzxa5vsgHf3pTeYJbWqoY7k/luMT4MIqxxi
	TzS2WA0A==;
From: Andreas Kemnade <andreas@kemnade.info>
To: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Roger Quadros <rogerq@kernel.org>,
	linux-omap@vger.kernel.org,
	Tony Lindgren <tony@atomide.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Aaro Koskinen <aaro.koskinen@iki.fi>,
	Stephen Boyd <sboyd@kernel.org>,
	Tero Kristo <kristo@kernel.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	linux-clk@vger.kernel.org,
	Andreas Kemnade <andreas@kemnade.info>
Subject: [PATCH v3 0/2] dt-bindings: clock: ti: convert to yaml
Date: Fri, 18 Oct 2024 10:53:45 +0200
Message-Id: <20241018085347.95071-1-andreas@kemnade.info>
X-Mailer: git-send-email 2.39.5
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert some clock schemas to yaml. These are one of the most used non-yaml
compatibles.

All can appear under a ti,clksel or without a ti,clksel.

I plan to convert the clock things from time to time.
So enforcing certain compatibles below ti,clksel is not there yet.

Open question: I set license to GPL-2 only because the .txt bindings the
yaml binding was derived from were
GPL-2. I personally have no problem with dual-licensing the binding.
No idea about the legal side wether that is possible or who must agree.

Changes in v3:
- adding more constraints and types
- strip labels from example
- fix references to divider.txt

Changes in v2:
- added conversion of divider
- require reg now, makes sense after
  https://lore.kernel.org/linux-omap/20240213105730.5287-1-tony@atomide.com/
- clean up of examples
- improvement of documentation

v1 is at https://lore.kernel.org/linux-omap/20231127202359.145778-1-andreas@kemnade.info/

Andreas Kemnade (2):
  dt-bindings: clock: ti: Convert interface.txt to json-schema
  dt-bindings: clock: ti: Convert divider.txt to json-schema

 .../bindings/clock/ti/composite.txt           |   2 +-
 .../devicetree/bindings/clock/ti/divider.txt  | 115 -----------
 .../bindings/clock/ti/interface.txt           |  55 -----
 .../bindings/clock/ti/ti,divider-clock.yaml   | 193 ++++++++++++++++++
 .../bindings/clock/ti/ti,interface-clock.yaml |  71 +++++++
 5 files changed, 265 insertions(+), 171 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/clock/ti/divider.txt
 delete mode 100644 Documentation/devicetree/bindings/clock/ti/interface.txt
 create mode 100644 Documentation/devicetree/bindings/clock/ti/ti,divider-clock.yaml
 create mode 100644 Documentation/devicetree/bindings/clock/ti/ti,interface-clock.yaml

-- 
2.39.5


