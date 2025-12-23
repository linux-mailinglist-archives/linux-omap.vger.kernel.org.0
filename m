Return-Path: <linux-omap+bounces-5247-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 96AE9CD914C
	for <lists+linux-omap@lfdr.de>; Tue, 23 Dec 2025 12:21:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 281F2305D666
	for <lists+linux-omap@lfdr.de>; Tue, 23 Dec 2025 11:16:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A583934D389;
	Tue, 23 Dec 2025 10:05:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pajerv1l";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DWFYLRS0"
X-Original-To: linux-omap@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01BED349B1B
	for <linux-omap@vger.kernel.org>; Tue, 23 Dec 2025 10:05:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766484304; cv=none; b=HQnDHG/jOri5KvptM1Fq+Y9p+IquyskShaMFEWIIhhVF54vZwOj5dxBBJTAORJBtO04KjG/gQETyuS+bC1Fta/u7yzcsIs9NsnjWVPepjmGsVhY6zOUP56DrFkqEHkelmuC8KZi7jx9PZlZf7AUS/jePL/TztBJd5GQbKlE76Ls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766484304; c=relaxed/simple;
	bh=hf4+ULdK6Tdx70XShge2syYlIjQYGUsU9b67SniGPyE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IBJPwyWs3h/BUr8vGrl5gypPLvBSXUFsIwyxlJhADkxlkyWA2HlA3/2eg+I/uM5xZWekfebk+dqdtuzwH6lD3C1b0cZGHEOvmd6vHek+gUU4seemPpNZ9MdbPjQnVkOX5GnUV9zyJ1G4UvTZlhwtzRUCOOUahr8ToSWG27BdgTw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pajerv1l; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DWFYLRS0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BN7UKdt2115198
	for <linux-omap@vger.kernel.org>; Tue, 23 Dec 2025 10:05:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	V05C6SXh9ijrxUyLg6sePAdo+myi6IwcToMWFCJUdZQ=; b=pajerv1lDNcrq7oF
	mQmcbA7QamlpI260lXdeMqWb5HuiGh8vx2uVdNJXoeJPkXbo/80d4tNJxKyqiGE+
	G8zAnP+XVLv+veOTawhxAaR/oat8TAB41Xd6WtOxJJifr/PVcCocFulHrAcoCFsr
	AQd3SVwAhK4FRc7quYsHVRgdxtfJrZuMc1SmBUsXBV59XehNxvWPgKkHhzP5MrCo
	6piL9Dfm3vOgSin59nFrOR5NwVn28Lustl+9xFSDanXLDZ/rzZDsW2qFLjRxgFn8
	dr+uwvgTiF5wlSvk/3O2qy1OoVE+R47c5OQ9vb0qoNTpS65ZXGBcO9sGIMSbtazj
	iIvkzA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b7cudj88s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-omap@vger.kernel.org>; Tue, 23 Dec 2025 10:05:01 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4f4ab58098eso105479911cf.1
        for <linux-omap@vger.kernel.org>; Tue, 23 Dec 2025 02:05:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766484300; x=1767089100; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=V05C6SXh9ijrxUyLg6sePAdo+myi6IwcToMWFCJUdZQ=;
        b=DWFYLRS0DiwIc5o0oHGcz++7IcQtCPdE5H8qnf/3RQX3kF51iuzpEr8oBnIQ31UZkF
         czfMMl7mRTZDa2MI9yuzk3j+phZfHt4z7QIZzDb9Vol2TS9eBd94rouXxuSf4rayxTJ4
         +ENA5VQ9aYs27xmNRuU9xwm/cO/YqKK2YDvRXNilwOMg7gG6soUJoT+JkXT2y1Lv0y/h
         NwPDbrlagy/doMDTvRYVxjYjKjhfy6e46dLMBpBQe6I8Sfmi1ilyiWP/CrMC79SQDRfG
         2qhGlXU9V/uMvzsMukjappnEfnq5yr5HjNHIXSN5yMxN1kLepgqtAK4PU3cwELCrR9Yc
         /fDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766484300; x=1767089100;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=V05C6SXh9ijrxUyLg6sePAdo+myi6IwcToMWFCJUdZQ=;
        b=KY4VGuLdCLWV34PUY6i1GUHwK6eS5eS+P4d8IPvlJAOp6MovCP92PyUQsuVDQDUx/Z
         5xwtL0mF1ZPuR/fUBmpWqbtcvP4/ZU9RAzZ3g8Zh5nswu6mcotIAIXdbkSvcSfCH0uEM
         57C2pbyl0dRxH8SfOWYxigpHjrbGR7aqFsMjJ3E7FxA5af8ilGBI8Oi9971MalTgNTVg
         VrysO1OJhlljl2cv0CUKQ8BaxPWOtoX9GtwvT9u9CZPZ0ohzRPBiWmz0rFn35hRPR1Lg
         dK3gtzKctGMPRCmw4bavMQh+61zKd8Tl+NsU8SJxJmzdjQtQU6r8IkSwgHR60rUwVVWw
         hHTg==
X-Forwarded-Encrypted: i=1; AJvYcCVTT3epkdWBx5FQRbBKVY5FNqmdsKAwfNvkSuePXc2/7mUBIfIRFoK2ZiIN/UM8o615lMYAqsdgR819@vger.kernel.org
X-Gm-Message-State: AOJu0Yxsmcsim92KSvu5EtajhP+2SeWwD6eCGujFM9VUcDMCdblG31kd
	EdVDjQr8ECrlwLWckKHKHEQ49ZoW1cfm9YSFNjbR1QoOF9GoPcThOlnd/SayqHjda/e8HQ15Qr2
	uVnRqEyOnZkwl6kLWDuFMk6rl7DIosTL0350Am9nSxT7/XDdDF0Hy8YUXLZPnY2BM
X-Gm-Gg: AY/fxX6yeIijt9AHlz3tRu0OeTjjHLrcuvlAk07D94NhQwWYK4UxQYDxjo4n9e5Dcof
	qB+7Z9qLMXrSk5FN+QhCtdRsUJnEJDFcf7/wMX57p8bFcVtLkqMcY5O25zMwrFg+jmDrgKHVNXe
	6jnY76JxP4GrrUYI6zSgGZoIGPv32d+OLfWw6vUii6gKKCaCwHWQkFabhyEaCrtx4zuQCKIkp7P
	BZHtml+nl0Prfx3qLbCBlnB/ReN6vg1yMAOlkRNfTGtaBmZZ6P2eq0xRDUrZuXxULoigGETw4ln
	CLFmAR9wFp087orYk61wAPvVlHyaSgEYBTKdEAPso8mwon1ZMQ3RyIq4p9/V0tH2Fg7yixgrQNr
	5Ls8ynyCO3S9Fz6b3yK92weUYUZECFXxOyQVv340=
X-Received: by 2002:a05:622a:1a9c:b0:4ee:208a:fbec with SMTP id d75a77b69052e-4f4abda6547mr210630111cf.66.1766484299945;
        Tue, 23 Dec 2025 02:04:59 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHqs8aoS5bfuwJD+WoHohzfrk6zAuOj6uBm6rrybCJgzMO87KV/ByX6nI9XDqN55s04/NcSkw==
X-Received: by 2002:a05:622a:1a9c:b0:4ee:208a:fbec with SMTP id d75a77b69052e-4f4abda6547mr210629761cf.66.1766484299529;
        Tue, 23 Dec 2025 02:04:59 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:190a:1976:65e2:c61])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d193d4f09sm235035025e9.12.2025.12.23.02.04.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 02:04:59 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 23 Dec 2025 11:04:40 +0100
Subject: [PATCH 02/12] i2c: qcom-geni: set device parent and of_node
 through the adapter struct
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251223-i2c-adap-dev-config-v1-2-4829b1cf0834@oss.qualcomm.com>
References: <20251223-i2c-adap-dev-config-v1-0-4829b1cf0834@oss.qualcomm.com>
In-Reply-To: <20251223-i2c-adap-dev-config-v1-0-4829b1cf0834@oss.qualcomm.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Andi Shyti <andi.shyti@kernel.org>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
        Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
        Vignesh R <vigneshr@ti.com>, Aaro Koskinen <aaro.koskinen@iki.fi>,
        Janusz Krzysztofik <jmkrzyszt@gmail.com>,
        Tony Lindgren <tony@atomide.com>,
        Andreas Kemnade <andreas@kemnade.info>,
        Kevin Hilman <khilman@baylibre.com>, Roger Quadros <rogerq@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Patrice Chotard <patrice.chotard@foss.st.com>,
        Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, Linus Walleij <linusw@kernel.org>
Cc: Bartosz Golaszewski <brgl@kernel.org>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-omap@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
        linux-rpi-kernel@lists.infradead.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1058;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=hf4+ULdK6Tdx70XShge2syYlIjQYGUsU9b67SniGPyE=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpSmk83XYxA2nG8trXqlh/POQctyaBd55aW/HEx
 yqR05jcKWWJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaUppPAAKCRAFnS7L/zaE
 w3K/D/9opRkZjX4lgmsOo1yyv8mXTtQbojGRw/+sWzvd3iklh7WtTGjjQw3irf5Q/NHiK0Ok7KC
 kTHtJHfu1jtbiCWCLHsJW2aprqmwxz0C3zjImvzFKUGd5EoTKhclKs6YpK6ejenbPt1crczvXsX
 DVbM0dp6qLrL83SuX7MnQ8ZWhYWn/pF233Q2eaDd/+QBVDVv3gck/FeJssLvB4N7h0CHawCHHEr
 GMGjxoeEVkiqR7aZITY5LorSFUmsIb3NTEUW3FVcWFpycxbRw3+p4wFQYDR1Ny7qGf2ILLmP/CJ
 U9LomEhmQZRkee/72jqKH8bo1FbfKP/P+VYyoUdTf4t9dOUL2U3LeMh485sQPqDTLq8Okh56v3s
 17XlETa8bmybd91T3pFrmxIV2mnuw7a1zsS5YVJwj6KqHK3T2ooXJwGCTBxcQCeWOdHttolsxuh
 puUqOv93aA/MSveDWf3ExFCRarP9b0NivMt85zgYH2M3WpsgSGYB/cAv2xSTgvWRw1FTwfaweW8
 ZacS/HhQPG3qxn2ZvGDzr/5ZHR65afrTsHquJQgEXAywgCExHGubbx+ijVtEDpPstDX36W2N6wm
 FRfjvhcCvUOisaTzzfyUkgcH50RcSIerJmDE+fwZ5XmXSwNOKtRL0ZivPRm8xYr+JtY7NIKtny4
 dfzPrDpz43UP7mw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=ebkwvrEH c=1 sm=1 tr=0 ts=694a694d cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=GyXxqrRC-9zytgsE6zAA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: umQDbaiHhko-xr78jk5YeFhy-f5w9HgY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIzMDA4MCBTYWx0ZWRfX6oW5SHTvyxWj
 R1oOCCqAjBR8gFMit8Xq89VojDVU+rjBeQP0cDi3Pi+bXmI3HdBnHKkEfSj+si89lIeQkUzGfjN
 bf89mSVeOYHWhfgua7cyE9CUbHN5IH8ttkHWR/Gfzj8ecvq0eleFeI8Lvaj1Uygr1wFa3nMHBL4
 OSYcraLWJl9pcE3EVCk6jgl8ZhtH32Ttp4TCmfub+hQgLI3leGDIW+6zyoTHa2iOgEzdsjTiGwZ
 PekE2bs62mTURmrRXdZ1/DjF01wJsmBVC89ujQuVY4wTyyNJe6v7cAoZ05BQtdk/jXOV4MGubuu
 Y6FWuvY6EtOeITiqMJ1agqC888MwIrlgPD3ysM4B+OFBMODse/Sy5snb0QhGHfdzXqaoVmWFc+r
 wP9pMtIMDpF5t0ga4QJtnNxaOXLKA+3JAc8jc87f1IsGJjST/6jMmDDreF313gIQkFG7ju1ui/f
 erTFcRORoo0NbY3N+2w==
X-Proofpoint-ORIG-GUID: umQDbaiHhko-xr78jk5YeFhy-f5w9HgY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-23_02,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 adultscore=0 suspectscore=0 clxscore=1011
 priorityscore=1501 bulkscore=0 spamscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512230080

Configure the parent device and the OF-node using dedicated fields in
struct i2c_adapter and avoid dereferencing the internal struct device.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/i2c/busses/i2c-qcom-geni.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
index 3a04016db2c3222cc6c91386f8904921014a3f90..389fa49f0ba7e657d97a94d9e27f5d916d1ffcf1 100644
--- a/drivers/i2c/busses/i2c-qcom-geni.c
+++ b/drivers/i2c/busses/i2c-qcom-geni.c
@@ -1038,8 +1038,8 @@ static int geni_i2c_probe(struct platform_device *pdev)
 				     "Request_irq failed: %d\n", gi2c->irq);
 
 	i2c_set_adapdata(&gi2c->adap, gi2c);
-	gi2c->adap.dev.parent = dev;
-	gi2c->adap.dev.of_node = dev->of_node;
+	gi2c->adap.parent = dev;
+	gi2c->adap.of_node = dev->of_node;
 	strscpy(gi2c->adap.name, "Geni-I2C", sizeof(gi2c->adap.name));
 
 	ret = geni_icc_get(&gi2c->se, desc ? desc->icc_ddr : "qup-memory");

-- 
2.47.3


