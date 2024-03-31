Return-Path: <linux-omap+bounces-1092-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 71AAE893132
	for <lists+linux-omap@lfdr.de>; Sun, 31 Mar 2024 12:26:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AC9071C211FE
	for <lists+linux-omap@lfdr.de>; Sun, 31 Mar 2024 10:26:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C99F776410;
	Sun, 31 Mar 2024 10:26:13 +0000 (UTC)
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82B52EEC0;
	Sun, 31 Mar 2024 10:26:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711880773; cv=none; b=HyrqipNXG4RmEjPFEIrZ0IJ9TnqnRVlJgvcC0sh+Ql54fsGKAsr0w2lyVLIKgRM7/rqd74g/FPvuaTYUzBM/HyQv5i5iqCptyGTG8L5NsuXWPpTRHeMuNIl0Tj+nMcjeErobfWnVbj3bCs6X4xchOSAnhWcRLirhy+enreku9jE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711880773; c=relaxed/simple;
	bh=6AKqxBQuhOwbqisg4ObQCrFphRBbPTiioJp5iOpryvc=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Rvk6U9n7bsyVc/FmBM8HzpZWxTIlL+Pzh+GxaRKzecH7LIsuqjz8k3s9qT7eET/kTdKei3gx7fRXlDicxbeHVy405j0kjf2N5sA7rGR1Q2HZWfCXUWMjC7Vwx5M3Cr5P8Yz5xFnU08rBBRibyFr10M1AUQXIWqKFLaF/d/iUJ/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17277C433F1;
	Sun, 31 Mar 2024 10:26:08 +0000 (UTC)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
	Tony Lindgren <tony@atomide.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Nishanth Menon <nm@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>,
	linux-omap@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH 1/2] arm64: dts: ti: k3-am62p5-sk: minor whitespace cleanup
Date: Sun, 31 Mar 2024 12:26:03 +0200
Message-Id: <171188072142.23696.6709925029705971875.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240208105146.128645-1-krzysztof.kozlowski@linaro.org>
References: <20240208105146.128645-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Thu, 08 Feb 2024 11:51:45 +0100, Krzysztof Kozlowski wrote:
> The DTS code coding style expects exactly one space before '{'
> character.
> 
> 

This is waiting on the lists for almost two months, so I just picked it up. Let
me know if anyone prefers to take it instead.

Applied, thanks!

[1/2] arm64: dts: ti: k3-am62p5-sk: minor whitespace cleanup
      https://git.kernel.org/krzk/linux-dt/c/9d0ee097b3e5873e4e98770b94f11481f485e7c9
[2/2] ARM: dts: ti: omap: minor whitespace cleanup
      https://git.kernel.org/krzk/linux-dt/c/021bc7094e8c8ac1380527d3f53561c9a234a190

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

