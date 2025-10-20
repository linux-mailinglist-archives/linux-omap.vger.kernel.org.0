Return-Path: <linux-omap+bounces-4719-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 95AD5BF147C
	for <lists+linux-omap@lfdr.de>; Mon, 20 Oct 2025 14:43:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3B3AB4604C8
	for <lists+linux-omap@lfdr.de>; Mon, 20 Oct 2025 12:36:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 24E453148BB;
	Mon, 20 Oct 2025 12:32:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="avbEM8yu"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA6162F9D8C;
	Mon, 20 Oct 2025 12:32:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760963531; cv=none; b=ln+AY3HvYQlulk+0iXAACdEoLoD4lcGS5NGioDMs+mxH+R9FFRuPyqfvwNdYmE5p1RwhqHyUqJwD4z0mt6q8FJy32DRsDOcWGzP+wEa3bCz5znKHkCyaII0/hehfQwFHSFBY/TU4qZkglnbPxWEHs2VYWydTc+rUcIWDdaBvtpw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760963531; c=relaxed/simple;
	bh=CDNpDbcsYFXA8RLzXkq1i9eCnbB+NSrW8FFCmAAvGY8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=fpSY79sULXFFyH12Dbq7Z/zROj1c5sIuKZEXWRj9WFFwAR1/ctWtp3CJvna7qbJYQx5QlTISDDSdFD34RCKGqPW0/qVo4xldUMe5uBc6xGot1vQw0hrZiTR3Ia3ck2B9+ztaQ1Y5XjmCf10JaPW2JPnylObKcZ+eoGscObV68aY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=avbEM8yu; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84DA6C116B1;
	Mon, 20 Oct 2025 12:32:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760963530;
	bh=CDNpDbcsYFXA8RLzXkq1i9eCnbB+NSrW8FFCmAAvGY8=;
	h=From:Subject:Date:To:Cc:From;
	b=avbEM8yunoWU+PzAJnmS+AOCdV4GxHE29CWzDsvpiyTZ403Vczw7+9j2kKpRJ7+FT
	 j/NvqZymORxfM/JSMq8tONlgSpPXU25+2GsBrbpQ/MACcOWAuVJYoOgDU2m4Np8up9
	 15HtodkBsGXjLEbaO/BtMXcguWOBvqLWjNk4HFO/YdXkTJo58XFb9xlhuaWvgAHDnd
	 zQfOCWA4BO7keHvZhWo+grd4WQuw36JkVo8pt2u1LvWFOtQhF56BhMWDEe7ZmPywOx
	 ez+t6K7tgDMha0UOs7veoivz0FzHY60eqOalk5c86V2GSX9bz0BO7CQesv6d7hg8qs
	 Lae06yS1iiHXw==
From: akemnade@kernel.org
Subject: [PATCH 0/3] mfd: twl603x: add power button
Date: Mon, 20 Oct 2025 14:31:57 +0200
Message-Id: <20251020-twl6030-button-v1-0-93e4644ac974@kernel.org>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAL0r9mgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1NDAyMD3ZLyHDMDYwPdpNKSkvw8XQvjFHNTyyQDM4NUMyWgpoKi1LTMCrC
 B0bG1tQCW8v/AYAAAAA==
X-Change-ID: 20251020-twl6030-button-83d759b060e6
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Andreas Kemnade <andreas@kemnade.info>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Tony Lindgren <tony@atomide.com>, Kevin Hilman <khilman@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-input@vger.kernel.org, linux-omap@vger.kernel.org, 
 Andreas Kemnade <akemnade@kernel.org>
X-Mailer: b4 0.15-dev-50721
X-Developer-Signature: v=1; a=openpgp-sha256; l=896; i=akemnade@kernel.org;
 h=from:subject:message-id; bh=CDNpDbcsYFXA8RLzXkq1i9eCnbB+NSrW8FFCmAAvGY8=;
 b=owGbwMvMwCUm/rzkS6lq2x3G02pJDBnftA+9N0r++/yY/YTIhc3H7zhtzGriWOL0RP93zwfWG
 XH2LgJlHaUsDGJcDLJiiiy/rBXcPqk8yw2eGmEPM4eVCWQIAxenAEzktSnDb5a6t5omrH4Oaw7O
 Z76S9UiT5ZzKzPtiM9WNDiR0c1hl6jIyLDui1t69WaLxttTrj8Uyu2JPxfO6Pq29G7H/orHTrlQ
 zNgA=
X-Developer-Key: i=akemnade@kernel.org; a=openpgp;
 fpr=EEC0DB858E66C0DA70620AC07DBD6AC74DE29324

Like the TWL4030, the TWL603x also has a power button feature, so add
a driver for it.

Signed-off-by: Andreas Kemnade <akemnade@kernel.org>
---
Andreas Kemnade (3):
      dt-bindings: mfd: twl: enable power button also for twl603x
      Input: add TWL603x power button
      ARM: dts: ti/omap: omap4-epson-embt2ws: add powerbutton

 Documentation/devicetree/bindings/mfd/ti,twl.yaml |  40 ++++++--
 arch/arm/boot/dts/ti/omap/omap4-epson-embt2ws.dts |   5 +
 drivers/input/misc/Kconfig                        |  10 ++
 drivers/input/misc/Makefile                       |   1 +
 drivers/input/misc/twl6030-pwrbutton.c            | 111 ++++++++++++++++++++++
 5 files changed, 159 insertions(+), 8 deletions(-)
---
base-commit: 3a8660878839faadb4f1a6dd72c3179c1df56787
change-id: 20251020-twl6030-button-83d759b060e6

Best regards,
--  
Andreas Kemnade <akemnade@kernel.org>


