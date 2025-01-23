Return-Path: <linux-omap+bounces-3200-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 29D77A1A932
	for <lists+linux-omap@lfdr.de>; Thu, 23 Jan 2025 18:49:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3AE4B3AC190
	for <lists+linux-omap@lfdr.de>; Thu, 23 Jan 2025 17:49:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D0FD193073;
	Thu, 23 Jan 2025 17:49:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=konsulko.com header.i=@konsulko.com header.b="kEdc3Lka"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE1F815625A
	for <linux-omap@vger.kernel.org>; Thu, 23 Jan 2025 17:49:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737654550; cv=none; b=ndWRubw7mzpj/tQNOS1ytrD5ADEwIIL8Y1w1ChZCQtv5T5/oKuBvT1CFXKFzzGLDlnsGg0Aq3NCF4FD4i2soBId+pHPAy0ZrpugfgXmjJbsUkALhfNzofp8czZjwwv5+nDtzEHpOwhKl6I5LAvLBZNykPx8HADag0qnHmZ/hfUA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737654550; c=relaxed/simple;
	bh=jCBH+fmaVyLfjCJZk+iTpTdeo2GwfqaFEO++65lxCYQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Usg73uy152MshG2ig0btDOwJE3lH+yQpUKHKsYt0byoMbK8KiFa6HD+wxYGU5jT/yzy7Mz3Ov+hBzaZXkJU0O7hhWf5I1WXusmog/bWdKXmr9OXYt65Qmu+lfFLyrt6UTMWWuJUIXL6TgOXwIF11hHvDIMwijhdCrAcWqJ8rYWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=konsulko.com; spf=pass smtp.mailfrom=konsulko.com; dkim=pass (1024-bit key) header.d=konsulko.com header.i=@konsulko.com header.b=kEdc3Lka; arc=none smtp.client-ip=209.85.222.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=konsulko.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=konsulko.com
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-7be44a90468so131355285a.3
        for <linux-omap@vger.kernel.org>; Thu, 23 Jan 2025 09:49:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1737654547; x=1738259347; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yoRqnvHsZvUJeikwcwZHMUql/hZyjzKs2CDqy+TdLPY=;
        b=kEdc3Lka2E0WnaK+Crf3+LcxvFyu8guh70UyaEIUi+2lLDl+SeaCrS7NsPlGZpmXVZ
         Gl//FcxZo4pBjushREd9DJVXtPCFGdtUsMfrto4tGCGj0wdwlG6LNhEjNvce/6RUs0UU
         gfde4rLW7kITOxH8G2+k40E51wXxI8N/Rd/w4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737654547; x=1738259347;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yoRqnvHsZvUJeikwcwZHMUql/hZyjzKs2CDqy+TdLPY=;
        b=gHXigAwFjI+rWVn2dQ+g5XDQkB/dABW9kl6zb9SE2yDfZGs3vhvBsH6YOI/sAKkuaW
         iwHuZzg/tGf/nlh06RNWS6MV7ba0oj2vH9ERfL20/wpJ5s6p460uwPFYGCTF0bonX1kC
         HUOKBZ9F2/Emm4nbdLrerE8r3GmgpLxpvWXjHWi08p0oYtnR0dEHpizJZjA371SPl8Yf
         u3gxHwYYGMhFTMMsP1XsU6NOR8HVIf3SW5LWhkQs2RgitORbBCHNqfr9NEtKIWNkhQIe
         w3msrWYCII+m/VlJfhuTG63i40+S3BGeBcrAubx0ZDHL8E7QSJCrz7ZLeq6M7QHEAyKg
         yleQ==
X-Forwarded-Encrypted: i=1; AJvYcCVitObJ+7Kn1TZDNRbb+QUr7l1nFS6+obOMY/XLZaI7Xlj9cuy/oJPR5oUpGymE7Mi5WaomcmWMvfE2@vger.kernel.org
X-Gm-Message-State: AOJu0YzmlztEBM0jEvmPqr3fYY/c0vIvU6fPTicOu6dIflxUpvZhQES7
	y4bxG3eoWPfPmsCLhLihWWd90uPH6DsDwpvvS+AtBZqc5SXZsWGXw3W8tXOIjzw=
X-Gm-Gg: ASbGncvqs9sGHArHMDgjDZSkTNUGQrjgTaWI9g9mU3fSziMREHqJuFVx11tn0mK3LS6
	I8+Oqlb33/hY1Uu+nNm1b78xEUKpED+nSxtvxiF6q6FJ/zHXxxvVavzPO9rdgs4H4mbCQiP28aH
	RDSqtePLDsQQIgYjkPbvS4v9ANEle5T2zTZK79vuYTx6RWE9id3Zu2Ybx6Tuzc7wWIS04CEmH8B
	JQ1wPiGifRnPVrVHdfzP2+eRfjLfFtCGewD41o7tgjnmCmYiwPEmyKzUszlZpTppWqY6JJkMe7G
	Lzwvc/Y=
X-Google-Smtp-Source: AGHT+IHPCsLgbgKZmOqpcUWR62T9gwQ4cJkD0wdSrcXxQPraQfJH5NPL3KW11OpRVz9ZggRBKMzvww==
X-Received: by 2002:a05:620a:1a81:b0:7b6:67df:51e3 with SMTP id af79cd13be357-7be631f481bmr2981045485a.16.1737654547497;
        Thu, 23 Jan 2025 09:49:07 -0800 (PST)
Received: from bill-the-cat.. ([189.177.145.20])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6e205136e02sm780536d6.20.2025.01.23.09.49.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jan 2025 09:49:06 -0800 (PST)
From: Tom Rini <trini@konsulko.com>
To: linux-kernel@vger.kernel.org
Cc: Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Robert Nelson <robertcnelson@gmail.com>,
	Tony Lindgren <tony@atomide.com>,
	devicetree@vger.kernel.org,
	linux-omap@vger.kernel.org
Subject: [PATCH v2 2/2] ARM: dts: omap4-panda-a4: Add missing model and compatible properties
Date: Thu, 23 Jan 2025 11:49:01 -0600
Message-ID: <20250123174901.1182176-2-trini@konsulko.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250123174901.1182176-1-trini@konsulko.com>
References: <20250123174901.1182176-1-trini@konsulko.com>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When moving the model and compatible properties out of the common
Pandaboard files and in to the specific boards, the omap4-panda-a4
file wasn't updated as well and so has lacked a model and compatible
entry ever since.

Fixes: a1a57abaaf82 ("ARM: dts: omap4-panda: Fix model and SoC family details")
Signed-off-by: Tom Rini <trini@konsulko.com>
---
Changes in v2:
- Include as part of the series with binding addition, make this the
  second patch.

Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Rob Herring <robh@kernel.org>
Cc: Robert Nelson <robertcnelson@gmail.com>
Cc: Tony Lindgren <tony@atomide.com>
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-omap@vger.kernel.org
---
 arch/arm/boot/dts/ti/omap/omap4-panda-a4.dts | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm/boot/dts/ti/omap/omap4-panda-a4.dts b/arch/arm/boot/dts/ti/omap/omap4-panda-a4.dts
index 8fd076e5d1b0..4b8bfd0188ad 100644
--- a/arch/arm/boot/dts/ti/omap/omap4-panda-a4.dts
+++ b/arch/arm/boot/dts/ti/omap/omap4-panda-a4.dts
@@ -7,6 +7,11 @@
 #include "omap443x.dtsi"
 #include "omap4-panda-common.dtsi"
 
+/ {
+	model = "TI OMAP4 PandaBoard (A4)";
+	compatible = "ti,omap4-panda-a4", "ti,omap4-panda", "ti,omap4430", "ti,omap4";
+};
+
 /* Pandaboard Rev A4+ have external pullups on SCL & SDA */
 &dss_hdmi_pins {
 	pinctrl-single,pins = <
-- 
2.43.0


