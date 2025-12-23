Return-Path: <linux-omap+bounces-5255-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id AB5ECCD8F10
	for <lists+linux-omap@lfdr.de>; Tue, 23 Dec 2025 11:49:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E4F1430A7042
	for <lists+linux-omap@lfdr.de>; Tue, 23 Dec 2025 10:43:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3D99350D47;
	Tue, 23 Dec 2025 10:05:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="M8SyapOH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ar+DcfUC"
X-Original-To: linux-omap@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B97C9350A33
	for <linux-omap@vger.kernel.org>; Tue, 23 Dec 2025 10:05:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766484324; cv=none; b=E4nEuEi8LE6Q6LKSusGAA+g4wgobVJaXKGxQIUOW4DCQyK/6t0t7v+bhIA2WOe6lJZNp1gqV8khh6YcCltrDlit6sjRRsSTSkapeksrQ7R6IefCEL+7g0ZOERkSVFQcO+w/Nud87mQ/5uJLyjjtFCBcZ7MBkabS81aEyG02XFaY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766484324; c=relaxed/simple;
	bh=a8UV6upSERzZiMxLa4pbl6Zm2TvGnZjx+Xqv9pXzXFc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XiwQO0HGRsHGqsxw5zoJyWqaDjPqqmkxqqblor6SzzBUfsD6WpkpAPjcFMuGarzezYSE7svKA5UW6pb/u88kCiCpnzKeVi6EW+YeYIQN2ezKKadWXARGjYUgYmjT6TKOrUHJxYRxVeLkW2nd5+ROefBJpTFmtyRuSYEARUETbqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=M8SyapOH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ar+DcfUC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BN7fjlq4044111
	for <linux-omap@vger.kernel.org>; Tue, 23 Dec 2025 10:05:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/FOPSFcqGMHY4FSkWDBAalpUhPARtyMNlPvPYteKJJA=; b=M8SyapOHuaKCmK6g
	DClYf9gv36ai/lBT6210yhTCG69DPzfV4PSPqoPtoAaH98/gPeppl/Els9g0sHu4
	dH3FiE7x3fAWRInzkFlJBSV461c2/rxqCsGSU329wslt4kBl970M/v5mPRadGxAw
	ZK5sWyqlaE8HNx9yFQKpQs+XAftrIBkQTy/sfm3jkwMePKoooxVtkMLdpw/wDB3j
	Tx/wKhUja8eC5Bb6/z/egevEOpgzblyWPRAcH1PVM2v/SlLeVRefgmPEwf1ifi62
	C+6no1YsDgwrvdY9aaF7Vt7ALSZFwNffg88Czh5lCnlgCqz40Nm/8svU8ItoGh2Z
	W1cJAw==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b7cuha6u1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-omap@vger.kernel.org>; Tue, 23 Dec 2025 10:05:18 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-88a360b8086so113408806d6.3
        for <linux-omap@vger.kernel.org>; Tue, 23 Dec 2025 02:05:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766484317; x=1767089117; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/FOPSFcqGMHY4FSkWDBAalpUhPARtyMNlPvPYteKJJA=;
        b=Ar+DcfUCLxt3u/xnhVUxyeys0fDT1UAEhe+qZvvo1xD3dR/u/g9tM1fuqFveeq2XIr
         9ftrPNxUYRVTs9E3JZ+s3CuDQnu7gvsWuC4TRIkD8OfA7t8HkU9gk52VxEsMe8yvKBfi
         vNcDMFhyixhY0d3niUIe5q+uqmIIe4UAmK5Od0XWWv5NHiaGgcxTy+5MAWBAW/3Jj5+p
         0kW2YaqXNS7hZzRcDJ7Owxad1GCBbSEsP3wq6g8qt2qPPug0/SBL20VB76oHr+alG/yx
         zoasDRhhDzWoZVQWLX4pT+5pK4QUw3Wtn59dmetOD0dS0NM1tbYa1khsDxbiVRUFZJDT
         jC7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766484317; x=1767089117;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/FOPSFcqGMHY4FSkWDBAalpUhPARtyMNlPvPYteKJJA=;
        b=Zj15UdvHqw4wjlok7RhuI+nar7wd1A2cTcZIcwVzmNlRG/yLg8MM0GDxbYEU2YPTjd
         /6TRxp3sxYz595wvTxe+aWZY91rUsYSFQxwFGi2WFGZGexqTi/kBY/V8rkGV/NuJYNAZ
         +K9iBYFP1Ek+3TlaQEhHh08Sltxo2D5YROdEn7+lWZ23PZQkcx9StShUbqqDtSBl5AdS
         SzA40kZJ+POUhcJORzQF9zegP/2q4yXiG8i2L7XM3CU+qFBEOFnvzQ4rxpck5t40U6fH
         itzWYA24yHPva0xBIISXInZBzPxNFwB69Z4xkeNbQbkfIUIjSdqWiA2m7tS3XMocOKav
         Pm4w==
X-Forwarded-Encrypted: i=1; AJvYcCWEkq6Km2dE/HRoee8CQYivyDJ3vITV8aCa1jFJNHL1nei6mxkCXuRbwFIi0bor/9zeE91EFicgA3Pa@vger.kernel.org
X-Gm-Message-State: AOJu0YzTU4NGJgKQbCn7snK4UuNx6V3gf6rmIStRHyDNfA1eiZx2bSB7
	Y9A6B5D4ImvuIATbmjr4fKLZckrQ/k9hk9xPLhVYBVPUuoQ4xk8sZO1Zs25KXN6Y6gUd22F9tY9
	ZZ/3ansZUmlj5p/NsRbr3LyrdqXVVUTXQ9U6hfy5mOlWemlyeAnh82085re4T0qaA
X-Gm-Gg: AY/fxX5qkuPIhkTH76mdwShXtab6dsSDjlD45gdMJOpO7zrwf3g6UqNz1llIwbe3H7F
	EXqEcZsjcQjshhpJzAXZe72LptILjjVtEljBLbEewRki2Mbpku3XG1H5DSa4vFvFtCiInxajNnc
	FsGtG/YWqZmBqmiHO3gs/tIa1Co3fY6b3uNHN71q0Ff6nvO6HXGGMBdydm5gx5meYZNaaU3+wLe
	hPDKxLBK55sFy26wmXtX7QsPEKVr+KN9RA0DLHjRI+GR73oxHxd76i7NU49cIJCef0GisSZBShL
	9qSRcOa1or+CdaiARNqdwz+o6WIJM2ve2GkjKKX8N2OVRbHTp11ycvbl/gk+gWaI9xxO5B1cMad
	pDRwzeFcB3ghlPgWGs7cuvsLsfVSrNcZiDo+gPGo=
X-Received: by 2002:ac8:6f06:0:b0:4f0:2b7e:c5c5 with SMTP id d75a77b69052e-4f4abbc7a72mr186179531cf.0.1766484317235;
        Tue, 23 Dec 2025 02:05:17 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEyr+cM52EnsiY9X9JwqntnVrF5BgN6w1ESxc7f6rP9YwP41RmdhZKCpIzJx2dLAd8JqdWN6w==
X-Received: by 2002:ac8:6f06:0:b0:4f0:2b7e:c5c5 with SMTP id d75a77b69052e-4f4abbc7a72mr186179071cf.0.1766484316736;
        Tue, 23 Dec 2025 02:05:16 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:190a:1976:65e2:c61])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d193d4f09sm235035025e9.12.2025.12.23.02.05.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 02:05:16 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 23 Dec 2025 11:04:48 +0100
Subject: [PATCH 10/12] i2c: gpio: set device parent and of_node through the
 adapter struct
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251223-i2c-adap-dev-config-v1-10-4829b1cf0834@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=825;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=a8UV6upSERzZiMxLa4pbl6Zm2TvGnZjx+Xqv9pXzXFc=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpSmlEeUL/Q15FR1biYp9tcKOXI8bceDaDmm4nY
 pSDfzSVR1mJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaUppRAAKCRAFnS7L/zaE
 w5H7D/9X5cvGLgf2JsLNSOAwLw9m6VU91GHNuXNctR1mCyxTnB1fkm7XnMj0pPmDNHVPUKlxZXy
 +y2zTwPZV/WGJitWyRS/ppkDKVJhOAhqmd8/266hcra08tpgC6E9U7V7nKET2Q2g7b8ZoLc8CpZ
 mPy0wVx57FkzZe1y5sVSfkGVMFxQ3wnALDH1JkHHgzAwfLt6HArLLSL8O5d0qbxXdAR1+JT57Eg
 Sn0RwrdFX39zMO6h4kCG0SoDeH1nXAOQ6TzzcUxvq6kk8ySWqHCnoFfdr4A6o9+ELVCAGDD7zb5
 DWkHQum7SRuPbiOQvEvp/cs4ym+eCOB9MhsWnJbvImHjaxR3v2eXwEVwpwTV8M3GxkP6tooqRT8
 7iEeJaAoY1NzmtTdGoaX+6w12Fs11xnwTsO078o2mL0o78A1kcmhZWJKO3O3zpZTfpHpfERG2Yq
 brr0oyrgv+7HmaEwzDYh1lOW1+6gPN2nubx3213yEXiDOwMLHFY9ESAUJLLBy5iBWfbgrmwiGLd
 aLiaZXAzAtbFj5x4jJ7I0/SewRlt9itvnAlHyKMFVw+IsofVej07D4ZVwAP3AZDuf7+DOL6Dbtm
 Dp6s2jvv0ty9RTnVGoeSbXXoT/L+yuOuoJmSs6lsjxNpSCOTHtP81AacY0NC59lU5KiRClUdsra
 i6GRY6JVgaFIeXQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-ORIG-GUID: 8d0t0T6VFrxJHrdXb0TK9Xw-ZnK7HoAM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIzMDA4MCBTYWx0ZWRfX15rkNUIECd0M
 1xH6rzg9qGDLBcGLoaPjxf1qnKhSxLHBsU+pDqNY+MQlzBlwHrZX+rMzBoGoM6+DXFkbD6gZ/XU
 Xbe5XSogas3vCK8beP1ZW7shC/5q2QyDb0RkrG9KThlNZE+LjBNiOd5M4nSfvwudP6Re88RfMz1
 MldPvqAzOkxs0busTDz8FOrRXMZ8e2Zsb+zLhB7cE6BfWF4e/xhcx5KYWFihEau1YJzZF25cNXH
 hUzGFCYwxlS+HY+OU+kEJImoDKoUF8dFrB4DSTOaszqBEqr0DeYcS5RGjhuGgLhTEsAjaL5R/nu
 pNalHf2xx4q1JvFi7ej2HKgxu0epq37U3KlM68ePJ/Ag35ezZtAF1KqrnJvYRPR8P8OQlMFI/0l
 QISrsOHmC6KUF+28YmuYtYUud1xXAo5BHzS3/bfIAIarR1Mt8WitM1v/MrhpfeNmZWE0+Sa0Fx4
 GkYFzIyLPz+A5rpOQQg==
X-Proofpoint-GUID: 8d0t0T6VFrxJHrdXb0TK9Xw-ZnK7HoAM
X-Authority-Analysis: v=2.4 cv=NZDrFmD4 c=1 sm=1 tr=0 ts=694a695e cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=hPzHJ5MbA3fyhucrTyIA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-23_02,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 clxscore=1011 impostorscore=0 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512230080

Configure the parent device using the dedicated field in struct
i2c_adapter and avoid dereferencing the internal struct device.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/i2c/busses/i2c-gpio.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-gpio.c b/drivers/i2c/busses/i2c-gpio.c
index f4355b17bfbf15c402e71096ccbb99f5a35bb479..78f8bc2525be6d1fd9a7907df4c253f33bbec9f0 100644
--- a/drivers/i2c/busses/i2c-gpio.c
+++ b/drivers/i2c/busses/i2c-gpio.c
@@ -425,7 +425,7 @@ static int i2c_gpio_probe(struct platform_device *pdev)
 
 	adap->algo_data = bit_data;
 	adap->class = I2C_CLASS_HWMON;
-	adap->dev.parent = dev;
+	adap->parent = dev;
 	device_set_node(&adap->dev, fwnode);
 
 	adap->nr = pdev->id;

-- 
2.47.3


