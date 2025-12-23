Return-Path: <linux-omap+bounces-5248-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EE945CD8DA8
	for <lists+linux-omap@lfdr.de>; Tue, 23 Dec 2025 11:39:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5B50E3005EA5
	for <lists+linux-omap@lfdr.de>; Tue, 23 Dec 2025 10:36:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EFB3834E256;
	Tue, 23 Dec 2025 10:05:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RW8AkFYE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="h9QHzCn5"
X-Original-To: linux-omap@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C75934D4E8
	for <linux-omap@vger.kernel.org>; Tue, 23 Dec 2025 10:05:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766484308; cv=none; b=Ma6dwSOsnhr0REfWg2sQBpYtkpxYMwxW2el0hXRZR2Ud7CFM4JcCRUHh8mLBGkxrf2aZgLyWNl7CyDxIS5XeKEkygrBp3go3SwBszwFZ3lvvSxMIwFK2dvxQY0ggPzb+8UD0xNpGgJ/vlIUExEJ4fjUIVejfZjawe+GsWgEVIcI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766484308; c=relaxed/simple;
	bh=bo4ZGFeMtG75ouEjaDX91gsDwyQD1Njwy7cFmjSQfKY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qs2QNT07o9COjTsJfcfM//Ruqi/c75LGzZly0Q6kf31u4f0ugtDwenIhgJxDMqZsPBlfDQVa/A6fsZ+efN2Nf6+rLG4sSRvGF+48uU68RSNBp1ei7MzQv7XhbK51QQv3xQaoMLbYNFGCxjAJczZZRHh12V3dRzq/eWaPEyk12f4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RW8AkFYE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=h9QHzCn5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BN2dMfO2199053
	for <linux-omap@vger.kernel.org>; Tue, 23 Dec 2025 10:05:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fvkc9n0P50/n/5hQkbKBw3GiCDGmeSmMMtzN5wuOhlQ=; b=RW8AkFYEduRKBW/W
	O/rrnXcsPJG48/Yk9RsQyHLAQsSQUJg4rMSIiR9BHf9N5/CvrbDheomOJXd7jp68
	9gc54c2UfYVouzEgysCs6fWpAN1rsjbVapbx3qF0FXHJlZFN+hfvwz+rbLh+/r/y
	FBtrBAw8V8DM9V92jjsj/P/BIi9tCB8/Yh5qR8wI7X6KJumhfsnNntU4TVyik0dN
	spzrEZemSU4Bs+CWduXtmTrPoR2f9fGJfCk4D7oa69yfjP9aUhNp8jHMjdqSJnp+
	/Q5oGDp2EEf3amNcU/MxI8kdNrVEmgPoYlRXLt49krvetD2mHlU0jUB+To7IgRsQ
	Towseg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b73fwurqq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-omap@vger.kernel.org>; Tue, 23 Dec 2025 10:05:05 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4f1b39d7ed2so106935831cf.2
        for <linux-omap@vger.kernel.org>; Tue, 23 Dec 2025 02:05:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766484304; x=1767089104; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fvkc9n0P50/n/5hQkbKBw3GiCDGmeSmMMtzN5wuOhlQ=;
        b=h9QHzCn57iy2LaaPRYAZG5lWkJ8AtCMDmi3aiaPcOkhRc75+P5V6vScRBrEDqlIp6H
         s9JLoZwvcXm96irqBj/dvpQuNG60/0HFDx5I0Fec1ukXQUPvwg86T2AlNLi9WXr8dBHt
         rdVklhrDWJyp6Nhtutv7PpdIM2CENRoY36HQN2nesnwaVUvew/rGo0tI+dm3S4xPYZ0G
         ynaXDQpf2ujiFz/ZZj6Xk6t4cdDVTKvC5DDhrJ/oPMjMzzJc0e0IsDk3qAOKLwHhI8Jr
         qeNeVhiHVivibye9S7/TVjUVgY9iAShqF8Z3R5DH4hy7aXlRQaDM00gvaMNGREgQp2ks
         lzGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766484304; x=1767089104;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fvkc9n0P50/n/5hQkbKBw3GiCDGmeSmMMtzN5wuOhlQ=;
        b=uaDPPo3Gifkh2YYf1pX3m4k+dOofti2pcYnxzSlzzDX+8AiNH9WwrYbARTlUlexvmz
         mdQOifaVds0l2qhXn/N/3soXMdhkvakBbgJsKV0O5lkObq61VnEeiOmXORzcuDezNWnz
         OmdQ+y7d1VF/+Nq7QIwQpaoGISkrRoW6NBW+MIdc5Qi+ux959ZlIVfDglQmrN2WmfNao
         ZZZSTRTmW56IvK2vVPXZcSurKDt5oT8LpSk2xka4MBM6zap6TMI4mCbUeySuVqV5N7nf
         a6617LNb8NoKT4t1BA6qSjgEZIpjRtfPs4fRuTRoE4DTc6cFzm0iDHK8CH0pnEfb5lLL
         VxjA==
X-Forwarded-Encrypted: i=1; AJvYcCVQEK5CLa67L2wyu97kE1pZiGTkkTfgzS8g+C7CtYywot+rvfVigq8or8//f7XYM7RKqTMKH1uHX53w@vger.kernel.org
X-Gm-Message-State: AOJu0YxAO2IzHAwT3e/xmMGswE9bNqC+LXBSA6tFy+d8h73oWlLiVCY+
	z9AyMop9+T6HcI1ptoVbpN8rI07trrwshqzZhMsfPqdGVcaL8/UM8gw5/nrbi7sdp1v9CppSlts
	j95BQN6f/e0+HblFGBWKmvFtTdd6uOiZcOM+LkeRNYst+RaPq3BWFzxn0YDg5LCOK
X-Gm-Gg: AY/fxX4Aj/YLIkonCs1CR7NpPqASqDg84zomAmQkuZ/GllHSwCtrbAUFCdYLEZlVWcg
	HzNygjYcFQFrnyH3fL8vBgYuEN9EvehK/PcsPL4ZQVLO/2/pFOCtPD7jmdhpcZ+0tZ1UZENePzi
	J2/l7b1uBMf25rjj6n7bxFKVV5qNTzP/DKc1ELOIQq75kCsBOqZpzFTTdmWLcVLkaI0uciAm8q4
	QUImAahPi1vW4b6yMHlCKo2txdDjVd7ujCHU2bkjK34s2mm6XgcWXbmUtNhdVNtK/Y8iWE3Jhqj
	4XfMNTDcRmHp2hr5ZaO/h3YCJoop8a/pQGydQ70GvMgQLIND4mPKOYaY6FgjsiziWl6a+qgBtGL
	LXJqR0JJMGZffUFxnLosiRopALoJ/VNTPNVIZpyc=
X-Received: by 2002:a05:622a:1aaa:b0:4dd:ca89:8d7d with SMTP id d75a77b69052e-4f4abda9b1cmr208230611cf.56.1766484304532;
        Tue, 23 Dec 2025 02:05:04 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHIjj9e+R9isgdw4TyIq3Hu1LbklgM+U32cHNPR6qnouGXpVQcoFz0NR6/hmM+Q9uZlUedF3w==
X-Received: by 2002:a05:622a:1aaa:b0:4dd:ca89:8d7d with SMTP id d75a77b69052e-4f4abda9b1cmr208230141cf.56.1766484304075;
        Tue, 23 Dec 2025 02:05:04 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:190a:1976:65e2:c61])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d193d4f09sm235035025e9.12.2025.12.23.02.05.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 02:05:03 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 23 Dec 2025 11:04:42 +0100
Subject: [PATCH 04/12] i2c: keba: set device parent and of_node through the
 adapter struct
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251223-i2c-adap-dev-config-v1-4-4829b1cf0834@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=820;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=bo4ZGFeMtG75ouEjaDX91gsDwyQD1Njwy7cFmjSQfKY=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpSmk+kwvyegNI/zPQvrSmXauolivDt5IGKfzgw
 GoGwiPiQAuJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaUppPgAKCRAFnS7L/zaE
 w7mcD/9bHC2rhBydNMtDo4LhxwjiUk1fcyXFZjeF/im9i5gyNKJ8bBrqQI2Kdt3dy0KPpziQOg0
 BSV0lAJO1bIqOsPwuc3KKYk3/hn0L+KYBp/b+lvF04I3enMZWRGN2S0/ffsbchxO1MeJ0V5b3cK
 hfZJu4EVftckpM0O9Yv8c60e5Nb2JR341WvhfCxS7D0AWLJQ7Rk7IPrwEI7YJEtHU2uOl+zA9Ld
 uPRMsZkDy+deZ7ByBQfd90O786cGcKAet5D0odFsO5H+ddDmmUTe3YAktpsbfuxMqXqhPoXaBEc
 i+Axp3by5tydT59O2lHrMDs/Kzwee5Ue1tcVNindG1cTlvgNekh52Q00KAe/rF6+70Vl73gf75/
 kBgWrGM7J5xycVb6ED7++BH7uqHlIFWJaWkWICSUKDy/Yfkg0hzCazcr7zLUZnu9CVkGX5dJcJM
 Qt4eQ6z6aMewRrdtwTarz/laWMPOVtvUcKNA7UIMw3BpzRzbDtPYmsXkQUfTjcVOCRrs0DD51JH
 M5IFzjAlpNlW+Ld5vdixHFgqRdl4rBK2wnGFXGfrzhXQnWlDLa1XbP5ZbHgyJ52ujLIX7IGrLRh
 45zcCCphst3DcutxyE6J+BLDoSOV/yQOlS/iZEGTJmOGPOYwogfJO+0o8ogUXhVpHOOjC76fo7z
 NMVpq68KkxBip5g==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=ELgLElZC c=1 sm=1 tr=0 ts=694a6951 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=op3mqaDViYxnCTu1ZhYA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIzMDA4MCBTYWx0ZWRfX2vtOJsZC4j2v
 G6+tFpKcvtE6316SGJi7An6mF1TdsyIdw7VZWlxb6b4L9J4dq+Tj6fcZZNkPinKIUVRwRVQovZA
 tCCDyoMKFvfGety/dKujB8AiwG0hKcZ9IkKIcQVEjUgFpXySRMwFEgo3lA+Ea/7ByRUWL473eox
 v7MNQ9h7C0gwvgv3yHf3AbluCw0BBa6KokJvN8aKkc3bUfnPJ8rEx2c0iSzOWNsRMIxFnXMduW0
 PNUEZyQpCGAxn6t24zjrvs5YEEjsanCn8JjeRn7BNPdydHz9wX/zDIxa9V+EQRLsV7/O1URcAau
 +mp5/rvvrZN3KMMIUZ8ADRvR3Q3m4VjrLwFQhpBUzBbOgtDguVp5cf39boErPjS8kzR014fuHyL
 rSVeoMjVLEzvIswnW3NPu7Z0TrNCzKiKyySXzveeeUNFoTZR4Kplr9hIDUUmRU6DZQHVSHVHDAa
 6iJQGtq8MHw27pHJNjA==
X-Proofpoint-GUID: 2ctBdHka4xOI3rsiRki-Af9KBDO1-M_C
X-Proofpoint-ORIG-GUID: 2ctBdHka4xOI3rsiRki-Af9KBDO1-M_C
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-23_02,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 spamscore=0 phishscore=0 impostorscore=0
 suspectscore=0 adultscore=0 clxscore=1015 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512230080

Configure the parent device using the dedicated field in struct
i2c_adapter and avoid dereferencing the internal struct device.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/i2c/busses/i2c-keba.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-keba.c b/drivers/i2c/busses/i2c-keba.c
index 9420c8b342b573da435eeef5a05efde35d61434d..01aa5dd9638dac38dd92500cc8890feb8020754c 100644
--- a/drivers/i2c/busses/i2c-keba.c
+++ b/drivers/i2c/busses/i2c-keba.c
@@ -532,7 +532,7 @@ static int ki2c_probe(struct auxiliary_device *auxdev,
 	adap->owner = THIS_MODULE;
 	adap->class = I2C_CLASS_HWMON;
 	adap->algo = &ki2c_algo;
-	adap->dev.parent = dev;
+	adap->parent = dev;
 
 	i2c_set_adapdata(adap, ki2c);
 

-- 
2.47.3


