Return-Path: <linux-omap+bounces-5256-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id DFB92CD8F00
	for <lists+linux-omap@lfdr.de>; Tue, 23 Dec 2025 11:48:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BE15A304D4D5
	for <lists+linux-omap@lfdr.de>; Tue, 23 Dec 2025 10:42:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1323834FF7C;
	Tue, 23 Dec 2025 10:05:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pogOhgER";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UJUDV1Ug"
X-Original-To: linux-omap@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45BD03502B9
	for <linux-omap@vger.kernel.org>; Tue, 23 Dec 2025 10:05:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766484326; cv=none; b=K0gfjKzoqyDbYUV7LsqO4n6Az8BxSh5pWczGGZUCx3Bth2JIzF/NhUU/czRypTSdFuW+N1SQmEPHCVY2eNM3o3R0FE/SNzIwnYpscjHg0Rd3SSiEKDDPcUsXBtrkjDjlUDS29XhN46xbrQHm0ukTX6fjRCe5y8h6cc6jzUti590=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766484326; c=relaxed/simple;
	bh=Kz3aoETjpXt/sy8S8XSk2Nfc0c3D2LQVFEQrK7qt+cA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UPh8nGPo+wdpa2fllKcAxxnNGmZ22YCWpSH5ybdF16zeyqqNcuSNUSZ3MIrUfpnh4FfKAe/6/EGBEXfp6ASuCUi+r8jI4vCqgxZcGxHEa7a9p49fzwZ5CzX2Pyl/H9Zyo7dMydo+VL3Gu3GnCtnW9RJ3tZGY4e6YDpLkdWTRv6k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pogOhgER; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UJUDV1Ug; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BN9vx1Y1889420
	for <linux-omap@vger.kernel.org>; Tue, 23 Dec 2025 10:05:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jUjtAsv0D/nDX9g0K0Dow7TqBy7ZhnMWXpaEBz4vKwg=; b=pogOhgERHMDldIkt
	KAhEDEfQfbo81lUnBP+JJYv8YmjHQu3ASOwq2syL8tnlHWf7xY9raerg4qvN4u7F
	jQ+T2OdTMuBz2x1zwTmH6s2kkqeXBbPOBTpQ+nOlPO4h+WI6sX0xZIA/AuW9uYNe
	opgpoMkieUBaqC4C5mFZ/m7bXyfvWemFDSKuB/XXQLoEqeCBLJagRawrw1rAtZFA
	GxaQF43ozUaaNu3B3GOrAS4DKMVArFToRyCwSd+Fcr6w31/mIPZg2koLqiuDxo1a
	xJ1P13mIpYGxOwoYb01spCOOFodqQZJgL3wKDyEMZrc4Gk2bdVwYIb3rpeBzy9W1
	akZw0g==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b770ak549-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-omap@vger.kernel.org>; Tue, 23 Dec 2025 10:05:19 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4f1d2aa793fso121789731cf.3
        for <linux-omap@vger.kernel.org>; Tue, 23 Dec 2025 02:05:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766484319; x=1767089119; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jUjtAsv0D/nDX9g0K0Dow7TqBy7ZhnMWXpaEBz4vKwg=;
        b=UJUDV1UgBQ5isXWEmji8DCloAcT4TYIQXweUFQlIzp1i9aO3FsaPwjh/QUMQLjgLzF
         rDbqZCQ683J7PZCgeXE/DaOxwz36fppVtGTO/kJOO470Wy4Y18mO0rVvgEjXiYpqHWxe
         bRb/SzVVboBQTARqVdhmm/dEST4pRAsfd37HAfLWJIWCcEGirOHNyMvfve9hMKGgAp7r
         /kPOKuciUgSsy7ymVyMt0TOj6KtU9A6i9p5OJo7NzVLFqlFQD6kuUiA6Fdqjq5dZCXAW
         Kfu/RjVV91yvIptWK4iTDudNbPDq3qKIwbkw74FEIgbuO7Gw3ghuA7UkMGNrHC9LLLSR
         QoUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766484319; x=1767089119;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=jUjtAsv0D/nDX9g0K0Dow7TqBy7ZhnMWXpaEBz4vKwg=;
        b=o9/+6qH/ug98jsi7BKR82EG/SIXZJi2tkgZhOLCI/IRjlG1fPFVIV9lmZKSZkTjjP4
         XJC/xHvYq85JLr8Z93SrNV4ckvzigMhVZe5iOlb8Wh7wIOYXMYLCq7NzMTtxT86M3ElF
         cnMXtpKHQmbZqC7sO81HoXX2R7MZgUNsPey8zt6IhE3tPxSlOO01vhpCCugaX0hoNy+h
         MIe7aC/HKaJDEiaJIDUx0T0bA69WuX0MaV2B8NC6zgVqSTPdo1USzBVC79QNGozmcCEu
         6Pk6lo3/IEiN4w/MGxYJomX3fDdlQkbIt3cYoVJf8zqx1dngcwDSOzLtM2XCe2lPzyUk
         6M+Q==
X-Forwarded-Encrypted: i=1; AJvYcCWI2tEgxIwoMGsY+APtSRLxLevTsZMJfMrTFPlDF/WP/7RngQEP0xWNNuhZ8Jb40sdToFLK8b7TQ6xy@vger.kernel.org
X-Gm-Message-State: AOJu0YwxLio03jgdoXkYETmv45eHQAKwE6vk/mO0ITcvg3OE/WcAoDsY
	Aj56La83neg6eBSdy6rshergDXaLh8XEMrzMWrh3wkdgHPLdpTAl7hz1mW3YwY30KlSmDRu9RG2
	41iq5trG2+fM/281SHwxO7v6VnXKPLvWz0PheAcUf0DY16NbG5AvfCIEY2s3s2VAq
X-Gm-Gg: AY/fxX7kqbBlAhRbMA1SA1Xx4DL0N+0EFTsejMHW0bR6A5c3KPr9/92MD3f4IWActkh
	q95iDomxfg/UKRqEJ6POsG0Ax0NvxNuM5l+pWb82JUJGBbITOFZkmdXrHwdcgEztt0BuSnpNzNR
	loJ9PduMOORnmeEd8yAYCIkfolnja6Wkv31A/4yEKYNuZ3dUHEPbVA6m+xA51OKC9ygBWE3yuWw
	R83Q4D7mrUN3+xDU1pDPGTLxrsyBlc9trXFL6j3+P93mkzAc1FR5Dm3lt1h0useuKc2rkn+gtMI
	850XjWuwwOuy6JQeIycTBK5+C8EX2hyNFXfI0zYL9+WSsssaT5R6vj5nLyGdG9Rbi1BKHAdW+Lc
	GlpOfPyZ98cbl4TvJSjWqlRuNqmIOUuatAzLm2bk=
X-Received: by 2002:a05:622a:24f:b0:4f1:ddda:9a26 with SMTP id d75a77b69052e-4f4abd122a3mr198669011cf.35.1766484319017;
        Tue, 23 Dec 2025 02:05:19 -0800 (PST)
X-Google-Smtp-Source: AGHT+IForFIDGNQ9njlDz41j98dh92a2O0U2qbhfYixKg3bKX3y+MnR1F9NI8gPqNhBANugj/T2Qbg==
X-Received: by 2002:a05:622a:24f:b0:4f1:ddda:9a26 with SMTP id d75a77b69052e-4f4abd122a3mr198668581cf.35.1766484318613;
        Tue, 23 Dec 2025 02:05:18 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:190a:1976:65e2:c61])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d193d4f09sm235035025e9.12.2025.12.23.02.05.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 02:05:18 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 23 Dec 2025 11:04:49 +0100
Subject: [PATCH 11/12] i2c: nomadik: set device parent and of_node through
 the adapter struct
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251223-i2c-adap-dev-config-v1-11-4829b1cf0834@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=939;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=Kz3aoETjpXt/sy8S8XSk2Nfc0c3D2LQVFEQrK7qt+cA=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpSmlEH8yQsYMAv6ooCMosuFd7IzlZjLcxciyOf
 UQM5iCbkxyJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaUppRAAKCRAFnS7L/zaE
 wwKlD/9mCvI2m04rBS/yTO76hF7LJmURZqComcwLRaJTxRw5Kj2GccDWLLba9W/EeWkgaY878dh
 mlgpACmVVjIj/prfsLX7VwnEpPwe4rki5hI3MGdAWPuOBB38zZjTUzpYhocg1jLTgeQGLQxmD2q
 CV4Uj9tLsSN03FmctRiu++tKRNFBOXMsa9K2Z3RAKe13mQwAxnJ5+8Z8HSgmA/JwZZqx1jRM8Qn
 bkWBgiK3t8ow0wq/mNyfLGgDNJc62hmdViGPZLJu412tx2uphiRhRTDobCLSQ9SZcJl5pGKTGYQ
 mHi80IJwOzRfDVKh+DstwfULzzMx4mgWRYr2BY+ktS3eabzeXRUE9aOQTJXFHqfqWILuhuWh/Tk
 PKLcv6/sCH659tOUBfTrwdR85pZbH1LWlXu6e0T7R3wv0TShScYr0aKotIF1j566ak4aqWasiT+
 sC4scVMWKAN4xMEFEaCIRB8Evbqcmd828SbMITuSWbD36vA727i1aE0Oy3V+4yX2Pe3jshJeQEe
 seOtLCdT9PrqO+tbQNx7JsOdrkZk54nPY6VxGMS+AUwQVbaFwbQR/kFLjgPXNFXdtEF0gTLW+fq
 0IaCwqUzHvnG6VJ1Gjbu8FYvHGsSYI0nbDwBTZkeLnbv6lKgiBUMxVS7r3oojb1ZN3OvLhNfYZs
 l4zyIT96c4hbKgA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIzMDA4MCBTYWx0ZWRfX9M1zJtj24iWP
 EVX4UQfe5jqY6KIpf3mtfdLFhltRDot9U+bcRqVYBRl9PQ2Tm5hyBJUa8V+qWooDJio55v0t3Va
 NvHZei/oL5RMj6tt/F6FSW4aew1PPcM4LuKZJRaE4NDOiBIy34oTBpucfQbuQhDEU3TXtVQwhMQ
 p7JnqyMHOGhl/arCg7supgEBSPlSlmdo6no1Qun6ihxBiXUcn6VNEmOO3UAN3q73y6qUVADZyXA
 2dCeQWIIjjA9UmtuPLqvLvKF/6M7Og/lIjeMcDha0qU9J1XYi3qeP1Yt7VKVtVcvm7cgu8nQdEj
 rmCzaPd/P6Cgzq21zHZL+uU6UoiXYIeZB8XyPg4Kg3+JF+VUZ0vPUOokd4eZ26DLaNQ7GQOkFhN
 SyMjBvq8m1Qj9jt7iWnuHzBxMjEBjd+FoPH0HO8puEstSFaQLTW/Z7ALSPDdGjKhQjwDHl28ZCl
 318lYzIOmJ6YZzPh1jg==
X-Authority-Analysis: v=2.4 cv=VqAuwu2n c=1 sm=1 tr=0 ts=694a695f cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=tIHrhau139UvCPJ7cvIA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: iSyMddjyvctOG3l86VwBHwwi1ZHQJmtE
X-Proofpoint-ORIG-GUID: iSyMddjyvctOG3l86VwBHwwi1ZHQJmtE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-23_02,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 impostorscore=0 malwarescore=0 adultscore=0
 priorityscore=1501 phishscore=0 clxscore=1015 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512230080

Configure the parent device and the OF-node using dedicated fields in
struct i2c_adapter and avoid dereferencing the internal struct device.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/i2c/busses/i2c-nomadik.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-nomadik.c b/drivers/i2c/busses/i2c-nomadik.c
index 19b648fc094d9748a0cce4e35f350da35ee25505..133ce90941ed596ba2e6dc2d9b368cebe7ace3a3 100644
--- a/drivers/i2c/busses/i2c-nomadik.c
+++ b/drivers/i2c/busses/i2c-nomadik.c
@@ -1147,8 +1147,8 @@ static int nmk_i2c_probe(struct amba_device *adev, const struct amba_id *id)
 	init_hw(priv);
 
 	adap = &priv->adap;
-	adap->dev.of_node = np;
-	adap->dev.parent = dev;
+	adap->of_node = np;
+	adap->parent = dev;
 	adap->owner = THIS_MODULE;
 	adap->class = I2C_CLASS_DEPRECATED;
 	adap->algo = &nmk_i2c_algo;

-- 
2.47.3


