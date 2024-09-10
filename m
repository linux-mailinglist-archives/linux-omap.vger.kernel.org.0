Return-Path: <linux-omap+bounces-2166-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D906972C6D
	for <lists+linux-omap@lfdr.de>; Tue, 10 Sep 2024 10:43:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DD9201F25F41
	for <lists+linux-omap@lfdr.de>; Tue, 10 Sep 2024 08:43:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1CD8C187FE8;
	Tue, 10 Sep 2024 08:43:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="GJuJFC6B"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 981CB183CDD
	for <linux-omap@vger.kernel.org>; Tue, 10 Sep 2024 08:43:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725957788; cv=none; b=iqhLD/MjWWmHfnZ4+99CSjhrRbZajmMwYzbesDPz7DHQBusSsHcG2Vd1ZV1y4uWknh/4+sZ6m0Q6+fBDeGUFDIirMVJ4juD4mTkuCQQZvjiNnMUFChuIls8kWnUUc389hHXiOtUX5jud4l/ld4rhmPEF0ndR+p+DxkdcuSB9Wwg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725957788; c=relaxed/simple;
	bh=D0x2lVYStmv2Mziz8G+pNKANNawmzUESJF1P7Repnl8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MAvB0GIB8YR+I7Lr+IAa+gO4canfhfgNlvFD4/QihX4XNem3gPNw5XSj1LMI2B8zl1oO6hQJZA95i21ON2Nlj6vzyU+Al8TnpNMM9VF1SKIDsaXGgJ3CnDOIC8CTG0VtV0q865t3MowzniHOg0DF+BsNRabPqPk6VdSxguswa+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=GJuJFC6B; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5365aec6fc1so4564775e87.3
        for <linux-omap@vger.kernel.org>; Tue, 10 Sep 2024 01:43:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1725957784; x=1726562584; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=9vSaoytFikj6NhnZ75FaqH1GqT7jphBAaH9Otxnzvfo=;
        b=GJuJFC6BO4gTlN1afB/uVlRk8eOZLK1nXQnwJ7HhBKGLs16/WosGDNYvcSbsV20gWi
         FHyNdEq+mgg3upQQn4Afg0s1tbttNJxqWUax1dVPBVm/LKqJF/Oz94/+1VSHEFoF7x0B
         /GZQ+1NuKsHEZOWdZLr97+mc8du0XyT3BRPPo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725957784; x=1726562584;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9vSaoytFikj6NhnZ75FaqH1GqT7jphBAaH9Otxnzvfo=;
        b=T6Q2rffuNhX1jCgZDhqbVpzALFCn+doE/JOiRPXM5T/RlrZFpWlbQr8yYNv/8qtzBG
         RmNu993SojCS/5/5xeldpXBuOVNihkeuL0yNKkvFs2str5xT0txzzF94wPF0uUWvsSeD
         /xEaoIG3bu+A2yebcHzFGEX7tgRfXfTBoId+xAwLaPKqrJxv/uSkydjDSdo3mfuTYgqn
         XCUXw9ABmU91lySqcCp5HJ6Uc3LlmC4dKrQ3oxV8KeynNFMOXzsPtYJg4xZVt8yBVbAT
         dsGc5zLGmhZ+mxpaGMKPHAtWs3GnMmDxy4LjZZ/uR2Q5dsy7+dKEKKn080tsfWak2b7d
         dvqQ==
X-Forwarded-Encrypted: i=1; AJvYcCX0baejRoi40LOUSkwWxlWy/QQJvefHft3knNZh/0pLWIQGy6fKiO4Yu8A4EzxXvH46bcndaxfblAFz@vger.kernel.org
X-Gm-Message-State: AOJu0YyRWlEOMaAZCvZ2tLYRxGePJl+IRr9tWgGpVvhDouv703YH2R8Q
	QQtmPUa+DUvfrbpBuFthKS6hNdR7ht4nSdGKSY6LFai/f0Q/H71PTZQJQ5pQV7fUxjLuVWl28hG
	SSH7f3ZXwTjSP+xvi8KuMt2/Fw+6lHgmp5yun
X-Google-Smtp-Source: AGHT+IEI0lG6DZ1W/RH/kT6jePAUaUwyEbPISSgjK5uBLGHjGcQP5DGAVuCzaFTtShIHwgt61jv11smK+oF/vpIC/Qs=
X-Received: by 2002:a05:6512:b1e:b0:535:3cdc:8763 with SMTP id
 2adb3069b0e04-536587a4249mr9639348e87.4.1725957783392; Tue, 10 Sep 2024
 01:43:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240910-ti-warn-v1-0-afd1e404abbe@kernel.org> <20240910-ti-warn-v1-2-afd1e404abbe@kernel.org>
In-Reply-To: <20240910-ti-warn-v1-2-afd1e404abbe@kernel.org>
From: Kalesh Anakkur Purayil <kalesh-anakkur.purayil@broadcom.com>
Date: Tue, 10 Sep 2024 14:12:49 +0530
Message-ID: <CAH-L+nOnGZkV05_N7tkaN2W_04TPVA6zhqKh9i-+rMuaN4OhzA@mail.gmail.com>
Subject: Re: [PATCH net-next 2/3] net: ethernet: ti: am65-cpsw: Use __be64
 type for id_temp
To: Simon Horman <horms@kernel.org>
Cc: "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Siddharth Vadapalli <s-vadapalli@ti.com>, Roger Quadros <rogerq@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, netdev@vger.kernel.org, 
	linux-omap@vger.kernel.org, llvm@lists.linux.dev
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha-256;
	boundary="0000000000009e69c90621bfdc0c"

--0000000000009e69c90621bfdc0c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 10, 2024 at 12:48=E2=80=AFPM Simon Horman <horms@kernel.org> wr=
ote:
>
> The id_temp local variable in am65_cpsw_nuss_probe() is
> used to hold a 64-bit big-endian value as it is assigned using
> cpu_to_be64().
>
> It is read using memcpy(), where it is written as an identifier into a
> byte-array.  So this can also be treated as big endian.
>
> As it's type is currently host byte order (u64), sparse flags
> an endian mismatch when compiling for little-endian systems:
>
> .../am65-cpsw-nuss.c:3454:17: warning: incorrect type in assignment (diff=
erent base types)
> .../am65-cpsw-nuss.c:3454:17:    expected unsigned long long [usertype] i=
d_temp
> .../am65-cpsw-nuss.c:3454:17:    got restricted __be64 [usertype]
>
> Address this by using __be64 as the type of id_temp.
>
> No functional change intended.
> Compile tested only.
>
> Signed-off-by: Simon Horman <horms@kernel.org>

Reviewed-by: Kalesh AP <kalesh-anakkur.purayil@broadcom.com>
> ---
>  drivers/net/ethernet/ti/am65-cpsw-nuss.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/net/ethernet/ti/am65-cpsw-nuss.c b/drivers/net/ether=
net/ti/am65-cpsw-nuss.c
> index a4b0e4bb7529..9e6353e0361e 100644
> --- a/drivers/net/ethernet/ti/am65-cpsw-nuss.c
> +++ b/drivers/net/ethernet/ti/am65-cpsw-nuss.c
> @@ -3444,7 +3444,7 @@ static int am65_cpsw_nuss_probe(struct platform_dev=
ice *pdev)
>         struct resource *res;
>         struct clk *clk;
>         int ale_entries;
> -       u64 id_temp;
> +       __be64 id_temp;
>         int ret, i;
>
>         common =3D devm_kzalloc(dev, sizeof(struct am65_cpsw_common), GFP=
_KERNEL);
>
> --
> 2.45.2
>
>


--=20
Regards,
Kalesh A P

--0000000000009e69c90621bfdc0c
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

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
riBJ/K1AFUjRAjFhGV64l++td7dkmnq/X8ET75ti+w1s4FRpFqkD2m7pg5NxdsZphYIXAgMBAAGj
QjBAMA4GA1UdDwEB/wQEAwIBBjAPBgNVHRMBAf8EBTADAQH/MB0GA1UdDgQWBBSP8Et/qC5FJK5N
UPpjmove4t0bvDANBgkqhkiG9w0BAQsFAAOCAQEAS0DbwFCq/sgM7/eWVEVJu5YACUGssxOGhigH
M8pr5nS5ugAtrqQK0/Xx8Q+Kv3NnSoPHRHt44K9ubG8DKY4zOUXDjuS5V2yq/BKW7FPGLeQkbLmU
Y/vcU2hnVj6DuM81IcPJaP7O2sJTqsyQiunwXUaMld16WCgaLx3ezQA3QY/tRG3XUyiXfvNnBB4V
14qWtNPeTCekTBtzc3b0F5nCH3oO4y0IrQocLP88q1UOD5F+NuvDV0m+4S4tfGCLw0FREyOdzvcy
a5QBqJnnLDMfOjsl0oZAzjsshnjJYS8Uuu7bVW/fhO4FCU29KNhyztNiUGUe65KXgzHZs7XKR1g/
XzCCBWowggRSoAMCAQICDDfBRQmwNSI92mit0zANBgkqhkiG9w0BAQsFADBbMQswCQYDVQQGEwJC
RTEZMBcGA1UEChMQR2xvYmFsU2lnbiBudi1zYTExMC8GA1UEAxMoR2xvYmFsU2lnbiBHQ0MgUjMg
UGVyc29uYWxTaWduIDIgQ0EgMjAyMDAeFw0yMjA5MTAwODI5NTZaFw0yNTA5MTAwODI5NTZaMIGi
MQswCQYDVQQGEwJJTjESMBAGA1UECBMJS2FybmF0YWthMRIwEAYDVQQHEwlCYW5nYWxvcmUxFjAU
BgNVBAoTDUJyb2FkY29tIEluYy4xHzAdBgNVBAMTFkthbGVzaCBBbmFra3VyIFB1cmF5aWwxMjAw
BgkqhkiG9w0BCQEWI2thbGVzaC1hbmFra3VyLnB1cmF5aWxAYnJvYWRjb20uY29tMIIBIjANBgkq
hkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAxnv1Reaeezfr6NEmg3xZlh4cz9m7QCN13+j4z1scrX+b
JfnV8xITT5yvwdQv3R3p7nzD/t29lTRWK3wjodUd2nImo6vBaH3JbDwleIjIWhDXLNZ4u7WIXYwx
aQ8lYCdKXRsHXgGPY0+zSx9ddpqHZJlHwcvas3oKnQN9WgzZtsM7A8SJefWkNvkcOtef6bL8Ew+3
FBfXmtsPL9I2vita8gkYzunj9Nu2IM+MnsP7V/+Coy/yZDtFJHp30hDnYGzuOhJchDF9/eASvE8T
T1xqJODKM9xn5xXB1qezadfdgUs8k8QAYyP/oVBafF9uqDudL6otcBnziyDBQdFCuAQN7wIDAQAB
o4IB5DCCAeAwDgYDVR0PAQH/BAQDAgWgMIGjBggrBgEFBQcBAQSBljCBkzBOBggrBgEFBQcwAoZC
aHR0cDovL3NlY3VyZS5nbG9iYWxzaWduLmNvbS9jYWNlcnQvZ3NnY2NyM3BlcnNvbmFsc2lnbjJj
YTIwMjAuY3J0MEEGCCsGAQUFBzABhjVodHRwOi8vb2NzcC5nbG9iYWxzaWduLmNvbS9nc2djY3Iz
cGVyc29uYWxzaWduMmNhMjAyMDBNBgNVHSAERjBEMEIGCisGAQQBoDIBKAowNDAyBggrBgEFBQcC
ARYmaHR0cHM6Ly93d3cuZ2xvYmFsc2lnbi5jb20vcmVwb3NpdG9yeS8wCQYDVR0TBAIwADBJBgNV
HR8EQjBAMD6gPKA6hjhodHRwOi8vY3JsLmdsb2JhbHNpZ24uY29tL2dzZ2NjcjNwZXJzb25hbHNp
Z24yY2EyMDIwLmNybDAuBgNVHREEJzAlgSNrYWxlc2gtYW5ha2t1ci5wdXJheWlsQGJyb2FkY29t
LmNvbTATBgNVHSUEDDAKBggrBgEFBQcDBDAfBgNVHSMEGDAWgBSWM9HmWBdbNHWKgVZk1b5I3qGP
zzAdBgNVHQ4EFgQUI3+tdStI+ABRGSqksMsiCmO9uDAwDQYJKoZIhvcNAQELBQADggEBAGfe1o9b
4wUud0FMjb/FNdc433meL15npjdYWUeioHdlCGB5UvEaMGu71QysfoDOfUNeyO9YKp0h0fm7clvo
cBqeWe4CPv9TQbmLEtXKdEpj5kFZBGmav69mGTlu1A9KDQW3y0CDzCPG2Fdm4s73PnkwvemRk9E2
u9/kcZ8KWVeS+xq+XZ78kGTKQ6Wii3dMK/EHQhnDfidadoN/n+x2ySC8yyDNvy81BocnblQzvbuB
a30CvRuhokNO6Jzh7ZFtjKVMzYas3oo6HXgA+slRszMu4pc+fRPO41FHjeDM76e6P5OnthhnD+NY
x6xokUN65DN1bn2MkeNs0nQpizDqd0QxggJtMIICaQIBATBrMFsxCzAJBgNVBAYTAkJFMRkwFwYD
VQQKExBHbG9iYWxTaWduIG52LXNhMTEwLwYDVQQDEyhHbG9iYWxTaWduIEdDQyBSMyBQZXJzb25h
bFNpZ24gMiBDQSAyMDIwAgw3wUUJsDUiPdpordMwDQYJYIZIAWUDBAIBBQCggdQwLwYJKoZIhvcN
AQkEMSIEIG6fo2WBRy4V60QNRcojzQyinu2lBtJz0D17RlBqVJgHMBgGCSqGSIb3DQEJAzELBgkq
hkiG9w0BBwEwHAYJKoZIhvcNAQkFMQ8XDTI0MDkxMDA4NDMwNFowaQYJKoZIhvcNAQkPMVwwWjAL
BglghkgBZQMEASowCwYJYIZIAWUDBAEWMAsGCWCGSAFlAwQBAjAKBggqhkiG9w0DBzALBgkqhkiG
9w0BAQowCwYJKoZIhvcNAQEHMAsGCWCGSAFlAwQCATANBgkqhkiG9w0BAQEFAASCAQAlj5YNyqFx
mvOqVIpx6ZK039JcAGvxH/6E8etvRKrv3UW8Xpgsx5B/J7aIn15G5+DlkCtGYCwzSJoDaTX2rPgg
gZ9vkvBo+LKowFP4jyVaPoBnmz5R3tgLuWzdY3G+Eidz/H7nFrTCUyQ20ucU23Lut/ycB05pHnvW
ZpoAxqQIZnqjm4mlO/PQFXENkhfY9OMjRxGZ5rX4G4pdMekwJ4HqlI/Cyemk47crPEEePT3W1OLw
5vZob7TcsF3VxWitl9IjRzCcqhhP52TLIH/LLL0tDV8CEi9lbopKegjs2YZ/ucEOExVWInUs1AZU
4SU+bk7f6n51QqLjg7CWCvK56c30
--0000000000009e69c90621bfdc0c--

