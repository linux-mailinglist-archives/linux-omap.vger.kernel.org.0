Return-Path: <linux-omap+bounces-2913-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 33A5F9FDA43
	for <lists+linux-omap@lfdr.de>; Sat, 28 Dec 2024 12:46:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C755C7A16C6
	for <lists+linux-omap@lfdr.de>; Sat, 28 Dec 2024 11:46:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 611451714B5;
	Sat, 28 Dec 2024 11:45:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Jl1Fvm35"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5429F158D96;
	Sat, 28 Dec 2024 11:45:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735386346; cv=none; b=uRt+2Uu823uWQZQyW3KL875txYlWXu5VbLQlp4f11Kas5M4N3HKWdgp0egHOvZVT7XJTTT9ynFyYQMjsTRBf2tfd5WRRMqFb7nqoCjrb7cga/VH6oe0/MY+xH76Z/DxM+4MHh+cUgOB5/gkcFwrC/Yw/n5Jp6WyV6gW3/fNqBxE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735386346; c=relaxed/simple;
	bh=oomA8INCiujbHuhJQLZolEAhwKc/GJDmeFlk6rCiPS0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=UDx4BhqX/FZ6zVkCtRzhdjrNB42J65m9C7uStltoF6RRWY8QNrUmRT4RMThWLXXDiSElZIDMNzHdkkEdJjmkYnZDONsgiC45TS7oFRrlHlDUzNdtxbby1QaXq9q5WHQ0EpKGxkuY2VNEV/DXZD7rR0CIEJHW/67p14Vxa/LgeyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Jl1Fvm35; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4361fe642ddso83229535e9.2;
        Sat, 28 Dec 2024 03:45:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735386343; x=1735991143; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fi8MyNB6ujYSDg0t/ugq0Xxj9SCvYo0uG2JlKHQdqSg=;
        b=Jl1Fvm35xZ51gOYgav9PcA/iWsoEJn9loBzd2yP+OYMA3fiP/zVgCGl1Yg7fJn829R
         rkhUOIVxEn1Z+LN2x22XNrwJUwLgGciGBZr0uAHsMMZPhsrjTknRsiXFfuMZ3yDK+tyA
         143rfLdtDGiyDU7usgJuNl+1XQPxR8Us5g9KHV2OfdFdSjVCApmY3uHr+ECTxCpRrle0
         lj5+km6MKCOjJPyUnzodoV9IrdZuT8/+5p3KCScRU0fy06UogYb8m0I8y71I7NFLopN9
         sl+IcK/orEI6yQ5ucLpPBy+z5wNu8jsh2NBfbOt4whAXRnq6QUma2TzgGkRMrqS6GtM2
         y41w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735386343; x=1735991143;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fi8MyNB6ujYSDg0t/ugq0Xxj9SCvYo0uG2JlKHQdqSg=;
        b=TY93NZW2WY4A74t1au5zS9ojbde2S08fmAWQvBz59vxlVsjOgryhU0O9t9UP2XVZJe
         tyRi6HXfW6DQJXk2sVMpkkKvP+XFulaMT6RjSjwTYuyCcsZ2IOkHlKeyeN77OK//1jA+
         AHUgvO1hrifEvhwzmbjJ1ZMf4PcCv5yrqau24vwMhEDm5j6dy3rIVI2c2WXo/KxVYFlm
         dQkIB6YAc8tNxcOKF6wCbHWJe/SfPDeOzBJe6SsNMPsOPsnhUGkfqgUHXMS8o65mJfPk
         8m7AnLHj0ng/kp627piLJ7VKFxTBZkX0TydKQVsrL7WAgxN31CiV/h8sbGzUAoIrhL7E
         Pe8g==
X-Forwarded-Encrypted: i=1; AJvYcCVWtG7OixV4dWL6pP+1wLrjnOPbN4BSh4IanhAr0kN9TS7g4hN91ufEnry1QS0khxg8G96RlQfiIGkttA==@vger.kernel.org, AJvYcCWjlG2zvc3IhZm9edHXEpXZY5sbRTrATGfIrHdy1PPX7QEP67CYNO0gpNrdGAia8OCvvIiEkzMsU4oukLI=@vger.kernel.org, AJvYcCXCr/ga9xzfGcIKbYVAFcRS1+67YJwK+5/b0Chn1eA7HhrsGi9R5fA1bunvZM0SEJqrtZ5h58GV9UkNC/8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwfppKgunCrEXXD9IlLvfbpHnTRZ/urGO7m7uf0bM0lgRH1xeET
	A813v3tfLaPNGfWJ9R9j0bdQBLYvc3OzxPAmxrvsVUJvwAieySbT
X-Gm-Gg: ASbGncsW6gihNYYR5NM1+zfBsObOnK73ucWLouEqJ/jHSLtq6e+2Vx46wo07ZKIqTMB
	lbUiy9g3QtL1MYVBH/U3fuFqw4APhBUAjro1WSTNLZzoGq2l+4QDXSwZIUVpX0w7ndPR2e4+I6Z
	CePZidvJLJWYWJXBa9kXpZ1H8EcX6FRqtFqYhYLMKzUAT4HZREwIcnvzOmAN8qVijYa1WasNFGY
	b08C7322YWoaKytlQbt52UwELkvUpaOPvNAgWNVNlKdEq15Rlsh5zy5G/1fbeSUNFjb5A0UkC88
	ppo=
X-Google-Smtp-Source: AGHT+IHcn/4WR+oIOgHXJC7u+v6co6Dcjmi09V0bWJXrbnB1Kr2WyIBrUf0umZZc+Gpw0VKEs6RmwQ==
X-Received: by 2002:a05:600c:1c12:b0:431:58cd:b259 with SMTP id 5b1f17b1804b1-4366d356dfcmr267543035e9.31.1735386342450;
        Sat, 28 Dec 2024 03:45:42 -0800 (PST)
Received: from localhost.localdomain ([95.43.220.235])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-436604e9c2csm295344975e9.43.2024.12.28.03.45.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Dec 2024 03:45:41 -0800 (PST)
From: Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>
To: Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Tony Lindgren <tony@atomide.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Javier Carrasco <javier.carrasco.cruz@gmail.com>
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-omap@vger.kernel.org,
	linux-sound@vger.kernel.org,
	Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>
Subject: [PATCH 4/5] arch: arm: dts: cpcap-mapphone: Add audio-codec jack detection interrupts
Date: Sat, 28 Dec 2024 13:45:13 +0200
Message-Id: <20241228114514.91594-5-ivo.g.dimitrov.75@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241228114514.91594-1-ivo.g.dimitrov.75@gmail.com>
References: <20241228114514.91594-1-ivo.g.dimitrov.75@gmail.com>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

cpcap audio-codec supports headset/micrphone detect interrupts, configure
them.

Signed-off-by: Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>
---
 arch/arm/boot/dts/ti/omap/motorola-cpcap-mapphone.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/boot/dts/ti/omap/motorola-cpcap-mapphone.dtsi b/arch/arm/boot/dts/ti/omap/motorola-cpcap-mapphone.dtsi
index 83fd58157579..f51de4f7bc11 100644
--- a/arch/arm/boot/dts/ti/omap/motorola-cpcap-mapphone.dtsi
+++ b/arch/arm/boot/dts/ti/omap/motorola-cpcap-mapphone.dtsi
@@ -69,6 +69,10 @@ cpcap_regulators: regulators {
 
 		cpcap_audio: audio-codec {
 			#sound-dai-cells = <1>;
+			interrupts-extended =
+				<&cpcap 9 0>,
+				<&cpcap 10 0>;
+			interrupt-names = "hs", "mb2";
 
 			port@0 {
 				cpcap_audio_codec0: endpoint {
-- 
2.30.2


