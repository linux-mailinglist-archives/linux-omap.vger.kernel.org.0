Return-Path: <linux-omap+bounces-3750-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EA7DAC9B54
	for <lists+linux-omap@lfdr.de>; Sat, 31 May 2025 16:14:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1A0BD7A29DC
	for <lists+linux-omap@lfdr.de>; Sat, 31 May 2025 14:12:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3ED5223C8A1;
	Sat, 31 May 2025 14:14:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iv4VoH58"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C7F32BCF5;
	Sat, 31 May 2025 14:13:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748700839; cv=none; b=esC/yHP//Y0H+nqQybGJ3xTtKyfyXerSNaE9h2L5G8i/QpPtCcf+taFAUPj1HN+KTiBii5/tWbDcRPsJz0vww6rgfpaNElrcH9vA/GAuvh/ZUc3Qbe71j7OQgToOoBMkH8H57g8301xiZLf1segms2eskT6gH0UfJ8FP4h6/1lY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748700839; c=relaxed/simple;
	bh=jClOl4d/ELwIaidMD0YDUkJojPmuj94eLxAmlAxnuR4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XQglfFcqEK2KNkPzUAp3N2r+6AJ+qGMhF2O8FFMiYiVGDGZLLZrVlWmdUgFhpeD3tG9BSlQSQ1YiuBdAFVFCRhbs5Ni0Dsx8M7P29Sa94Aw6DSxaHpEhBTDT52QSGBn6QSkFpcZuEKV4uLrc8o85tXB1ISwqdpITDMNMusprFTo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iv4VoH58; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-312150900afso3019742a91.1;
        Sat, 31 May 2025 07:13:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748700838; x=1749305638; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZByPvqrueKC3c9aa9kKxrMQLY2qgkp2Pbw7suNhDht0=;
        b=iv4VoH585LXr0A/tTf2l+zqIEihaxxYTxlwx36H56sHoDEMjMKq1BzYQb6/7zXv7KU
         rGKlCmmuC61iyrtD5zWGGMVPw6SWpl1QziKhmsr2d9IjY2nTjzrXHCxV0ia2EClgYU7u
         3J4abned+Sav0Diqj9mT1Zj0aMzD2Ba0UXE4eTC+YdkhzE7MYMkzeQEAOurFczuw3Y47
         XwLBdfw5QaxEIJCGP/jVC3dwVFtWXazcbr7EfyN3+O5nWJmyRmHvwA+WJheOZ+lsrUPA
         SktX839+5Km57hJLkGL/8kE50ToPmUPSkDz/Nb4/nWv1pIKa9FkIE5fgJ23c2RQCBdLb
         9j3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748700838; x=1749305638;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZByPvqrueKC3c9aa9kKxrMQLY2qgkp2Pbw7suNhDht0=;
        b=usDhMj87UwjGgewu48FKcFKVF0tT1SHPO6PkiRmxh193ETVpaJpoVAZrknEskXiGFM
         fVU9GtCBLUm+ht2IawzjdafNNT3J8MhYVZJAih4m6dNjXC/QYfIAsfPkXjnC0cao2G2v
         xOBGInJPqvd94Gg6tfwnO+8fR+7/2IzeMQyWyWJB2HEnFmEHS6P4D1CdRkBjKmj3ICIo
         WJastaSMCMGIDO4hsmDpWKkP84PL+yP26EjsMbs5R/JUtoj8eafRkuMaPRtdkju5KirB
         sK6k32n2gHQC96p9pOF8Qo4eMN+I4EZ7EqYvgHtSZJNs/iL762ZGH40ho4lxlR7MvpJd
         /6Jg==
X-Forwarded-Encrypted: i=1; AJvYcCUTRGxVDxLK/+jLWFyF2FuNPy0Tkf7k6MDvG8xZXRI6ykGRGdc5l/C6n7gIXTmUbjIIdDGwBS15A/GchoI=@vger.kernel.org, AJvYcCWaZtsKJmpsr0f3nT4YaeYYqPT8BmBlLGsOu0CA0b5aHZajUTrgURNHNirxaKl/JrCFw301B5hd9oRO1g==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2/IBxeuq6yEVgOgfvEu7WXt0nsN6KadT0GmLQRtw6sGSOcwV3
	xYmrihjyz7QuUKEYasJWXj02Pm7X+Bk0YmY2p3zgURg9SahTU/5p5SF8TOzH1oy/
X-Gm-Gg: ASbGncuNevE7nygua+lPNzAgCt1YFRYjGN3dtnaB17uoWZHXASi4zCXRcpXI+czMHD/
	jwMBFhZrwebTgza0FzPdVgOxJZPBbiOA8lkOzFGpR5W7UmaTQIHZq9jbZgaAqNMguTYBOgCab27
	WMozVKVI5s3n5m2ufkMEU2xyrft/hGDWG37DM5rzu3jNjwkhxqmcTKX4CvJXijsZzEWhZ1GOgn3
	Grg4Xk6rmZtxhmxXJE1Xg4ZcrQHksKrCUQMTCVDxx635jNqys9HKCobeKjOiHqTpjoGW4uG3C2z
	esNSlD0Uz+6o7198/6t6ZCMEuZj6Q820vdkb/LUPh+ZhcDV8JA6ky3jvAYCNnB5GiQ84pvTv/LS
	piw==
X-Google-Smtp-Source: AGHT+IFYU4KVCP8B3byl3tmb0tTbxJppAnwli3RGwvqFUoEzTzVn13HOAyXwmQfc7P7gQn9gi+RgOw==
X-Received: by 2002:a17:90a:ec8d:b0:312:1e41:3a58 with SMTP id 98e67ed59e1d1-3127c871ca7mr2752786a91.34.1748700837652;
        Sat, 31 May 2025 07:13:57 -0700 (PDT)
Received: from yn386-ZK.. (p1273134-ipoe.ipoe.ocn.ne.jp. [122.26.118.133])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3124e29f883sm2774643a91.1.2025.05.31.07.13.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 May 2025 07:13:57 -0700 (PDT)
From: Yuuki NAGAO <wf.yn386@gmail.com>
To: Peter Ujfalusi <peter.ujfalusi@gmail.com>,
	Jarkko Nikula <jarkko.nikula@bitmer.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org,
	linux-omap@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Yuuki NAGAO <wf.yn386@gmail.com>
Subject: [PATCH] ASoC: ti: omap-hdmi: Re-add dai_link->platform to fix card init
Date: Sat, 31 May 2025 23:13:41 +0900
Message-ID: <20250531141341.81164-1-wf.yn386@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The removed dai_link->platform component cause a fail which
is exposed at runtime. (ex: when a sound tool is used)
This patch re-adds the dai_link->platform component to have
a full card registered.

Before this patch:
$ aplay -l
**** List of PLAYBACK Hardware Devices ****
card 1: HDMI [HDMI], device 0: HDMI snd-soc-dummy-dai-0 []
  Subdevices: 1/1
  Subdevice #0: subdevice #0

$ speaker-test -D plughw:1,0 -t sine
speaker-test 1.2.8
Playback device is plughw:1,0
Stream parameters are 48000Hz, S16_LE, 1 channels
Sine wave rate is 440.0000Hz
Playback open error: -22,Invalid argument

After this patch which restores the platform component:
$ aplay -l
**** List of PLAYBACK Hardware Devices ****
card 0: HDMI [HDMI], device 0: HDMI snd-soc-dummy-dai-0 [HDMI snd-soc-dummy-dai-0]
  Subdevices: 0/1
  Subdevice #0: subdevice #0

-> Resolve the playback error.

Fixes: 3b0db249cf8f ("ASoC: ti: remove unnecessary dai_link->platform")

Signed-off-by: Yuuki NAGAO <wf.yn386@gmail.com>
---
 sound/soc/ti/omap-hdmi.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/sound/soc/ti/omap-hdmi.c b/sound/soc/ti/omap-hdmi.c
index cf43ac19c4a6..55e7cb96858f 100644
--- a/sound/soc/ti/omap-hdmi.c
+++ b/sound/soc/ti/omap-hdmi.c
@@ -361,17 +361,20 @@ static int omap_hdmi_audio_probe(struct platform_device *pdev)
 	if (!card->dai_link)
 		return -ENOMEM;
 
-	compnent = devm_kzalloc(dev, sizeof(*compnent), GFP_KERNEL);
+	compnent = devm_kzalloc(dev, 2 * sizeof(*compnent), GFP_KERNEL);
 	if (!compnent)
 		return -ENOMEM;
-	card->dai_link->cpus		= compnent;
+	card->dai_link->cpus		= &compnent[0];
 	card->dai_link->num_cpus	= 1;
 	card->dai_link->codecs		= &snd_soc_dummy_dlc;
 	card->dai_link->num_codecs	= 1;
+	card->dai_link->platforms	= &compnent[1];
+	card->dai_link->num_platforms	= 1;
 
 	card->dai_link->name = card->name;
 	card->dai_link->stream_name = card->name;
 	card->dai_link->cpus->dai_name = dev_name(ad->dssdev);
+	card->dai_link->platforms->name = dev_name(ad->dssdev);
 	card->num_links = 1;
 	card->dev = dev;
 
-- 
2.43.0


