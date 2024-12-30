Return-Path: <linux-omap+bounces-2924-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 507119FE9C0
	for <lists+linux-omap@lfdr.de>; Mon, 30 Dec 2024 19:17:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3A91718805CA
	for <lists+linux-omap@lfdr.de>; Mon, 30 Dec 2024 18:17:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0C901B0439;
	Mon, 30 Dec 2024 18:17:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VKhoTF+0"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D4EC1B042A;
	Mon, 30 Dec 2024 18:17:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735582633; cv=none; b=KDZ3r3WMto1heUcVGYnx8AnEWOr/lGW1Zuk0bmlqZr0qoyyXjW2FLYEYdyYT8R6JU9U2OcIWjMU0Aqpi5+e2bP+BWjSb9MPOKtZFbQJ2K3VtcacjbBGuVWyDGs2KRCKebm8gI1g1ErtDYD8aIs+lCAMEFvL2oh6QSQDua+SJvWs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735582633; c=relaxed/simple;
	bh=M+8ODu+NcsSasBWUDQnE0IOpS+zNhHlJ4SvGTpQo2E4=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=scaFnrR2XD9H/TXFRzsvDZKU+hmBVNEHMqdyGxGdZ49W8js4xg1oFuqOZRB/rhfEIc9wgczupqVZ22j0c+qoWiK6F63r2ECYy4bL4wpHg2qFk+OCtHWAc+VNa3WAzRCx1ezmpfeNRKK/M+Ojgo+4sfQPN+R5RKmdr3CNKWh0RVo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VKhoTF+0; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2FF0C4CED2;
	Mon, 30 Dec 2024 18:17:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735582633;
	bh=M+8ODu+NcsSasBWUDQnE0IOpS+zNhHlJ4SvGTpQo2E4=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=VKhoTF+0ceP75HwwI+JSuNptbO5hJwu222OEAbR+tQUAaI7ZylJgszSPYy8BJZKwg
	 rn7/P4y8vEGc5C0qwM6lVdZokOusn7uGd06PYuNuV+WRnc8GdO9NmYH3HIykUIJfIh
	 HC8OS8Sn8CcdUC9aFdeDSg2AVW4xHb2iX2FrcgHJjmWPqExcbc9gpdWmQi1D2vSU2m
	 1ytsvxa/3L0tA17TjovM4Y/YY5aujDcc7KuivKQxyli5iF7W6qz/UA1eK3bv5ZR6F7
	 5GI4iu44OyjvnxOm3b7vMlkIOErjG4xphLpETyUKFIugcftmR/HP42T1FxEuLGzaee
	 fh3GM1x3+1irA==
Date: Mon, 30 Dec 2024 12:17:11 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-kernel@vger.kernel.org, Aaro Koskinen <aaro.koskinen@iki.fi>, 
 devicetree@vger.kernel.org, Kevin Hilman <khilman@baylibre.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Tony Lindgren <tony@atomide.com>, 
 Roger Quadros <rogerq@kernel.org>, linux-omap@vger.kernel.org, 
 Conor Dooley <conor+dt@kernel.org>
To: Andreas Kemnade <andreas@kemnade.info>
In-Reply-To: <20241229230125.85787-1-andreas@kemnade.info>
References: <20241229230125.85787-1-andreas@kemnade.info>
Message-Id: <173558214240.2262575.18233884215338168789.robh@kernel.org>
Subject: Re: [PATCH 0/2] ARM: dts: omap4: panda: TiWilink improvements


On Mon, 30 Dec 2024 00:01:23 +0100, Andreas Kemnade wrote:
> Add proper definitions for 32k clock and enable bluetooth
> everywhere.
> 
> Andreas Kemnade (2):
>   ARM: dts: omap4: panda: fix resources needed for Panda
>   ARM: dts: omap4: panda: cleanup bluetooth
> 
>  .../boot/dts/ti/omap/omap4-panda-common.dtsi  | 38 ++++++++++++++++++-
>  arch/arm/boot/dts/ti/omap/omap4-panda-es.dts  | 32 ----------------
>  2 files changed, 36 insertions(+), 34 deletions(-)
> 
> --
> 2.39.5
> 
> 
> 


My bot found new DTB warnings on the .dts files added or changed in this
series.

Some warnings may be from an existing SoC .dtsi. Or perhaps the warnings
are fixed by another series. Ultimately, it is up to the platform
maintainer whether these warnings are acceptable or not. No need to reply
unless the platform maintainer has comments.

If you already ran DT checks and didn't see these error(s), then
make sure dt-schema is up to date:

  pip3 install dtschema --upgrade


New warnings running 'make CHECK_DTBS=y ti/omap/omap4-panda-es.dtb' for 20241229230125.85787-1-andreas@kemnade.info:

arch/arm/boot/dts/ti/omap/omap4-panda-es.dtb: serial@0: {'compatible': ['ti,omap4-uart'], 'reg': [[0, 256]], 'interrupts': [[0, 73, 4]], 'clock-frequency': 48000000, 'pinctrl-names': ['default'], 'pinctrl-0': [[119]], 'interrupts-extended': [[1, 0, 73, 4], [117, 220]], 'bluetooth': {'compatible': ['ti,wl1271-st'], 'pinctrl-names': ['default'], 'pinctrl-0': [[120]], 'enable-gpios': [[121, 14, 0]], 'clocks': [[122, 0]], 'clock-names': ['ext_clock']}, '$nodename': ['serial@0']} is valid under each of {'required': ['interrupts-extended']}, {'required': ['interrupts']}
	from schema $id: http://devicetree.org/schemas/serial/8250_omap.yaml#






